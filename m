Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F889C4167B
	for <intel-xe@archiver.kernel.org>; Tue,  5 Dec 2023 18:10:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2302910E5F3;
	Tue,  5 Dec 2023 18:10:07 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id A6E3310E5E6;
 Tue,  5 Dec 2023 18:10:04 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 8E8E4AADD1;
 Tue,  5 Dec 2023 18:10:04 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5163756366939262855=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bommu Krishnaiah" <krishnaiah.bommu@intel.com>
Date: Tue, 05 Dec 2023 18:10:04 -0000
Message-ID: <170179980457.24286.18442892827881833252@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231205143755.4834-1-krishnaiah.bommu@intel.com>
In-Reply-To: <20231205143755.4834-1-krishnaiah.bommu@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_RFC=3A_dr?=
 =?utf-8?q?m/xe/uapi=3A_Return_correct_error_code_for_xe=5Fwait=5Fuser=5Ff?=
 =?utf-8?q?ence=5Fioctl?=
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

--===============5163756366939262855==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: RFC: drm/xe/uapi: Return correct error code for xe_wait_user_fence_ioctl
URL   : https://patchwork.freedesktop.org/series/127365/
State : failure

== Summary ==

CI Bug Log - changes from xe-550-ac7b89571d802765762e7c15d78a6dcd5d92c41b_BAT -> xe-pw-127365v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-127365v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-127365v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-127365v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:
    - bat-pvc-2:          [PASS][1] -> [TIMEOUT][2] +2 other tests timeout
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-550-ac7b89571d802765762e7c15d78a6dcd5d92c41b/bat-pvc-2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127365v1/bat-pvc-2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html
    - bat-dg2-oem2:       [PASS][3] -> [TIMEOUT][4] +2 other tests timeout
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-550-ac7b89571d802765762e7c15d78a6dcd5d92c41b/bat-dg2-oem2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127365v1/bat-dg2-oem2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html

  * igt@xe_evict@evict-mixed-threads-small:
    - bat-atsm-2:         [PASS][5] -> [TIMEOUT][6] +2 other tests timeout
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-550-ac7b89571d802765762e7c15d78a6dcd5d92c41b/bat-atsm-2/igt@xe_evict@evict-mixed-threads-small.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127365v1/bat-atsm-2/igt@xe_evict@evict-mixed-threads-small.html

  * igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate:
    - bat-pvc-2:          [PASS][7] -> [FAIL][8] +26 other tests fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-550-ac7b89571d802765762e7c15d78a6dcd5d92c41b/bat-pvc-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127365v1/bat-pvc-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_compute_mode@twice-preempt-fence-early:
    - bat-adlp-7:         [PASS][9] -> [FAIL][10] +18 other tests fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-550-ac7b89571d802765762e7c15d78a6dcd5d92c41b/bat-adlp-7/igt@xe_exec_compute_mode@twice-preempt-fence-early.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127365v1/bat-adlp-7/igt@xe_exec_compute_mode@twice-preempt-fence-early.html

  * igt@xe_exec_compute_mode@twice-userptr-invalidate:
    - bat-atsm-2:         [PASS][11] -> [FAIL][12] +30 other tests fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-550-ac7b89571d802765762e7c15d78a6dcd5d92c41b/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127365v1/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html

  * igt@xe_waitfence@engine:
    - bat-dg2-oem2:       [PASS][13] -> [FAIL][14] +30 other tests fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-550-ac7b89571d802765762e7c15d78a6dcd5d92c41b/bat-dg2-oem2/igt@xe_waitfence@engine.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127365v1/bat-dg2-oem2/igt@xe_waitfence@engine.html

  
#### Warnings ####

  * igt@xe_evict@evict-beng-small-cm:
    - bat-pvc-2:          [DMESG-FAIL][15] ([Intel XE#482]) -> [FAIL][16] +3 other tests fail
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-550-ac7b89571d802765762e7c15d78a6dcd5d92c41b/bat-pvc-2/igt@xe_evict@evict-beng-small-cm.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127365v1/bat-pvc-2/igt@xe_evict@evict-beng-small-cm.html

  
Known issues
------------

  Here are the changes found in xe-pw-127365v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_reset@cm-close-fd-no-exec:
    - bat-pvc-2:          [PASS][17] -> [FAIL][18] ([Intel XE#818])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-550-ac7b89571d802765762e7c15d78a6dcd5d92c41b/bat-pvc-2/igt@xe_exec_reset@cm-close-fd-no-exec.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127365v1/bat-pvc-2/igt@xe_exec_reset@cm-close-fd-no-exec.html
    - bat-adlp-7:         [PASS][19] -> [FAIL][20] ([Intel XE#818])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-550-ac7b89571d802765762e7c15d78a6dcd5d92c41b/bat-adlp-7/igt@xe_exec_reset@cm-close-fd-no-exec.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127365v1/bat-adlp-7/igt@xe_exec_reset@cm-close-fd-no-exec.html
    - bat-dg2-oem2:       [PASS][21] -> [FAIL][22] ([Intel XE#818])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-550-ac7b89571d802765762e7c15d78a6dcd5d92c41b/bat-dg2-oem2/igt@xe_exec_reset@cm-close-fd-no-exec.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127365v1/bat-dg2-oem2/igt@xe_exec_reset@cm-close-fd-no-exec.html

  * igt@xe_waitfence@abstime:
    - bat-atsm-2:         [PASS][23] -> [FAIL][24] ([Intel XE#826])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-550-ac7b89571d802765762e7c15d78a6dcd5d92c41b/bat-atsm-2/igt@xe_waitfence@abstime.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127365v1/bat-atsm-2/igt@xe_waitfence@abstime.html

  
#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-dp3:
    - bat-dg2-oem2:       [FAIL][25] ([Intel XE#480]) -> [PASS][26] +1 other test pass
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-550-ac7b89571d802765762e7c15d78a6dcd5d92c41b/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp3.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127365v1/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp3.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:
    - bat-adlp-7:         [FAIL][27] ([Intel XE#480]) -> [PASS][28] +1 other test pass
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-550-ac7b89571d802765762e7c15d78a6dcd5d92c41b/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127365v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html

  * igt@xe_create@create-execqueues-noleak:
    - bat-adlp-7:         [FAIL][29] ([Intel XE#524]) -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-550-ac7b89571d802765762e7c15d78a6dcd5d92c41b/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127365v1/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html

  
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/482
  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524
  [Intel XE#818]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/818
  [Intel XE#826]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/826


Build changes
-------------

  * IGT: IGT_7620 -> IGT_7622
  * Linux: xe-550-ac7b89571d802765762e7c15d78a6dcd5d92c41b -> xe-pw-127365v1

  IGT_7620: 6714b814e7f82743abf45c33361fbe057a22880a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7622: 48a47d91b7727215b965690c69d84159c8fb1aa2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-550-ac7b89571d802765762e7c15d78a6dcd5d92c41b: ac7b89571d802765762e7c15d78a6dcd5d92c41b
  xe-pw-127365v1: 127365v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127365v1/index.html

--===============5163756366939262855==
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
<tr><td><b>Series:</b></td><td>RFC: drm/xe/uapi: Return correct error code for xe_wait_user_fence_ioctl</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/127365/">https://patchwork.freedesktop.org/series/127365/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127365v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127365v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-550-ac7b89571d802765762e7c15d78a6dcd5d92c41b_BAT -&gt; xe-pw-127365v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-127365v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-127365v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-127365v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:</p>
<ul>
<li>
<p>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-550-ac7b89571d802765762e7c15d78a6dcd5d92c41b/bat-pvc-2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127365v1/bat-pvc-2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">TIMEOUT</a> +2 other tests timeout</p>
</li>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-550-ac7b89571d802765762e7c15d78a6dcd5d92c41b/bat-dg2-oem2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127365v1/bat-dg2-oem2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">TIMEOUT</a> +2 other tests timeout</p>
</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-small:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-550-ac7b89571d802765762e7c15d78a6dcd5d92c41b/bat-atsm-2/igt@xe_evict@evict-mixed-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127365v1/bat-atsm-2/igt@xe_evict@evict-mixed-threads-small.html">TIMEOUT</a> +2 other tests timeout</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-550-ac7b89571d802765762e7c15d78a6dcd5d92c41b/bat-pvc-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127365v1/bat-pvc-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html">FAIL</a> +26 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-preempt-fence-early:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-550-ac7b89571d802765762e7c15d78a6dcd5d92c41b/bat-adlp-7/igt@xe_exec_compute_mode@twice-preempt-fence-early.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127365v1/bat-adlp-7/igt@xe_exec_compute_mode@twice-preempt-fence-early.html">FAIL</a> +18 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-userptr-invalidate:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-550-ac7b89571d802765762e7c15d78a6dcd5d92c41b/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127365v1/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html">FAIL</a> +30 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@engine:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-550-ac7b89571d802765762e7c15d78a6dcd5d92c41b/bat-dg2-oem2/igt@xe_waitfence@engine.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127365v1/bat-dg2-oem2/igt@xe_waitfence@engine.html">FAIL</a> +30 other tests fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_evict@evict-beng-small-cm:<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-550-ac7b89571d802765762e7c15d78a6dcd5d92c41b/bat-pvc-2/igt@xe_evict@evict-beng-small-cm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/482">Intel XE#482</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127365v1/bat-pvc-2/igt@xe_evict@evict-beng-small-cm.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-127365v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_exec_reset@cm-close-fd-no-exec:</p>
<ul>
<li>
<p>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-550-ac7b89571d802765762e7c15d78a6dcd5d92c41b/bat-pvc-2/igt@xe_exec_reset@cm-close-fd-no-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127365v1/bat-pvc-2/igt@xe_exec_reset@cm-close-fd-no-exec.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/818">Intel XE#818</a>)</p>
</li>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-550-ac7b89571d802765762e7c15d78a6dcd5d92c41b/bat-adlp-7/igt@xe_exec_reset@cm-close-fd-no-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127365v1/bat-adlp-7/igt@xe_exec_reset@cm-close-fd-no-exec.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/818">Intel XE#818</a>)</p>
</li>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-550-ac7b89571d802765762e7c15d78a6dcd5d92c41b/bat-dg2-oem2/igt@xe_exec_reset@cm-close-fd-no-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127365v1/bat-dg2-oem2/igt@xe_exec_reset@cm-close-fd-no-exec.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/818">Intel XE#818</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@abstime:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-550-ac7b89571d802765762e7c15d78a6dcd5d92c41b/bat-atsm-2/igt@xe_waitfence@abstime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127365v1/bat-atsm-2/igt@xe_waitfence@abstime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/826">Intel XE#826</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-dp3:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-550-ac7b89571d802765762e7c15d78a6dcd5d92c41b/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127365v1/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-550-ac7b89571d802765762e7c15d78a6dcd5d92c41b/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127365v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_create@create-execqueues-noleak:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-550-ac7b89571d802765762e7c15d78a6dcd5d92c41b/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/524">Intel XE#524</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127365v1/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7620 -&gt; IGT_7622</li>
<li>Linux: xe-550-ac7b89571d802765762e7c15d78a6dcd5d92c41b -&gt; xe-pw-127365v1</li>
</ul>
<p>IGT_7620: 6714b814e7f82743abf45c33361fbe057a22880a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7622: 48a47d91b7727215b965690c69d84159c8fb1aa2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-550-ac7b89571d802765762e7c15d78a6dcd5d92c41b: ac7b89571d802765762e7c15d78a6dcd5d92c41b<br />
  xe-pw-127365v1: 127365v1</p>

</body>
</html>

--===============5163756366939262855==--
