Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FF7DC61D9B
	for <intel-xe@archiver.kernel.org>; Wed, 22 Nov 2023 09:12:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62AB810E2FA;
	Wed, 22 Nov 2023 09:12:40 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 99AB110E2FA;
 Wed, 22 Nov 2023 09:12:37 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 8049DA0093;
 Wed, 22 Nov 2023 09:12:37 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5518316970781602239=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bommu Krishnaiah" <krishnaiah.bommu@intel.com>
Date: Wed, 22 Nov 2023 09:12:37 -0000
Message-ID: <170064435748.4728.13454050427511740374@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231122042142.6648-1-krishnaiah.bommu@intel.com>
In-Reply-To: <20231122042142.6648-1-krishnaiah.bommu@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_RFC=3A_dr?=
 =?utf-8?q?m/xe=3A_Return_correct_error_code_for_xe=5Fwait=5Fuser=5Ffence?=
 =?utf-8?q?=5Fioctl_=28rev2=29?=
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

--===============5518316970781602239==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: RFC: drm/xe: Return correct error code for xe_wait_user_fence_ioctl (rev2)
URL   : https://patchwork.freedesktop.org/series/126549/
State : failure

== Summary ==

CI Bug Log - changes from xe-515-a9ee4928479a5449991149cc38747e8e20376db9_BAT -> xe-pw-126549v2_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-126549v2_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-126549v2_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 3)
------------------------------

  Missing    (1): bat-atsm-2 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-126549v2_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_evict@evict-mixed-threads-small-multi-vm:
    - bat-pvc-2:          [PASS][1] -> [TIMEOUT][2] +2 other tests timeout
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-pvc-2/igt@xe_evict@evict-mixed-threads-small-multi-vm.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126549v2/bat-pvc-2/igt@xe_evict@evict-mixed-threads-small-multi-vm.html
    - bat-dg2-oem2:       [PASS][3] -> [TIMEOUT][4] +2 other tests timeout
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-dg2-oem2/igt@xe_evict@evict-mixed-threads-small-multi-vm.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126549v2/bat-dg2-oem2/igt@xe_evict@evict-mixed-threads-small-multi-vm.html

  * igt@xe_exec_compute_mode@twice-preempt-fence-early:
    - bat-dg2-oem2:       [PASS][5] -> [FAIL][6] +23 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-dg2-oem2/igt@xe_exec_compute_mode@twice-preempt-fence-early.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126549v2/bat-dg2-oem2/igt@xe_exec_compute_mode@twice-preempt-fence-early.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:
    - bat-pvc-2:          [PASS][7] -> [FAIL][8] +36 other tests fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-pvc-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126549v2/bat-pvc-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html

  * igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race:
    - bat-adlp-7:         [PASS][9] -> [FAIL][10] +11 other tests fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-adlp-7/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126549v2/bat-adlp-7/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html

  
#### Warnings ####

  * igt@xe_evict@evict-small-cm:
    - bat-pvc-2:          [DMESG-FAIL][11] ([Intel XE#482]) -> [FAIL][12] +3 other tests fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-pvc-2/igt@xe_evict@evict-small-cm.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126549v2/bat-pvc-2/igt@xe_evict@evict-small-cm.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate}:
    - bat-adlp-7:         [PASS][13] -> [FAIL][14] +4 other tests fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-adlp-7/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126549v2/bat-adlp-7/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html
    - bat-dg2-oem2:       [PASS][15] -> [FAIL][16] +4 other tests fail
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-dg2-oem2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126549v2/bat-dg2-oem2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html

  * {igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate}:
    - bat-pvc-2:          [PASS][17] -> [FAIL][18] +19 other tests fail
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-pvc-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126549v2/bat-pvc-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html

  
Known issues
------------

  Here are the changes found in xe-pw-126549v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_waitfence@abstime:
    - bat-pvc-2:          [PASS][19] -> [FAIL][20] ([Intel XE#407]) +2 other tests fail
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-pvc-2/igt@xe_waitfence@abstime.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126549v2/bat-pvc-2/igt@xe_waitfence@abstime.html
    - bat-dg2-oem2:       [PASS][21] -> [FAIL][22] ([Intel XE#407]) +1 other test fail
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-dg2-oem2/igt@xe_waitfence@abstime.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126549v2/bat-dg2-oem2/igt@xe_waitfence@abstime.html
    - bat-adlp-7:         [PASS][23] -> [FAIL][24] ([Intel XE#407]) +1 other test fail
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-adlp-7/igt@xe_waitfence@abstime.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126549v2/bat-adlp-7/igt@xe_waitfence@abstime.html

  
#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-adlp-7:         [DMESG-WARN][25] ([Intel XE#939]) -> [PASS][26]
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126549v2/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html
    - bat-dg2-oem2:       [DMESG-WARN][27] ([Intel XE#939]) -> [PASS][28]
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126549v2/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-dg2-oem2:       [FAIL][29] ([Intel XE#480]) -> [PASS][30] +1 other test pass
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126549v2/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@xe_guc_pc@freq_basic_api:
    - bat-adlp-7:         [FAIL][31] ([Intel XE#935]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-adlp-7/igt@xe_guc_pc@freq_basic_api.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126549v2/bat-adlp-7/igt@xe_guc_pc@freq_basic_api.html
    - bat-pvc-2:          [FAIL][33] ([Intel XE#935]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-pvc-2/igt@xe_guc_pc@freq_basic_api.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126549v2/bat-pvc-2/igt@xe_guc_pc@freq_basic_api.html
    - bat-dg2-oem2:       [FAIL][35] ([Intel XE#935]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-dg2-oem2/igt@xe_guc_pc@freq_basic_api.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126549v2/bat-dg2-oem2/igt@xe_guc_pc@freq_basic_api.html

  * igt@xe_guc_pc@freq_fixed_idle:
    - bat-dg2-oem2:       [FAIL][37] ([Intel XE#940]) -> [PASS][38] +1 other test pass
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-dg2-oem2/igt@xe_guc_pc@freq_fixed_idle.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126549v2/bat-dg2-oem2/igt@xe_guc_pc@freq_fixed_idle.html

  * igt@xe_guc_pc@freq_range_idle:
    - bat-adlp-7:         [FAIL][39] ([Intel XE#940]) -> [PASS][40] +1 other test pass
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-adlp-7/igt@xe_guc_pc@freq_range_idle.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126549v2/bat-adlp-7/igt@xe_guc_pc@freq_range_idle.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/407
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/482
  [Intel XE#935]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/935
  [Intel XE#939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/939
  [Intel XE#940]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/940


Build changes
-------------

  * Linux: xe-515-a9ee4928479a5449991149cc38747e8e20376db9 -> xe-pw-126549v2

  IGT_7595: cfa00d99b1dfa0621ea552d1ed54907798da1a1a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-515-a9ee4928479a5449991149cc38747e8e20376db9: a9ee4928479a5449991149cc38747e8e20376db9
  xe-pw-126549v2: 126549v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126549v2/index.html

--===============5518316970781602239==
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
<tr><td><b>Series:</b></td><td>RFC: drm/xe: Return correct error code for xe_wait_user_fence_ioctl (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/126549/">https://patchwork.freedesktop.org/series/126549/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126549v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126549v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-515-a9ee4928479a5449991149cc38747e8e20376db9_BAT -&gt; xe-pw-126549v2_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-126549v2_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-126549v2_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 3)</h2>
<p>Missing    (1): bat-atsm-2 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-126549v2_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_evict@evict-mixed-threads-small-multi-vm:</p>
<ul>
<li>
<p>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-pvc-2/igt@xe_evict@evict-mixed-threads-small-multi-vm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126549v2/bat-pvc-2/igt@xe_evict@evict-mixed-threads-small-multi-vm.html">TIMEOUT</a> +2 other tests timeout</p>
</li>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-dg2-oem2/igt@xe_evict@evict-mixed-threads-small-multi-vm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126549v2/bat-dg2-oem2/igt@xe_evict@evict-mixed-threads-small-multi-vm.html">TIMEOUT</a> +2 other tests timeout</p>
</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-preempt-fence-early:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-dg2-oem2/igt@xe_exec_compute_mode@twice-preempt-fence-early.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126549v2/bat-dg2-oem2/igt@xe_exec_compute_mode@twice-preempt-fence-early.html">FAIL</a> +23 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-pvc-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126549v2/bat-pvc-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">FAIL</a> +36 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-adlp-7/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126549v2/bat-adlp-7/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html">FAIL</a> +11 other tests fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_evict@evict-small-cm:<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-pvc-2/igt@xe_evict@evict-small-cm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/482">Intel XE#482</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126549v2/bat-pvc-2/igt@xe_evict@evict-small-cm.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate}:</p>
<ul>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-adlp-7/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126549v2/bat-adlp-7/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html">FAIL</a> +4 other tests fail</p>
</li>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-dg2-oem2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126549v2/bat-dg2-oem2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html">FAIL</a> +4 other tests fail</p>
</li>
</ul>
</li>
<li>
<p>{igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate}:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-pvc-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126549v2/bat-pvc-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html">FAIL</a> +19 other tests fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-126549v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_waitfence@abstime:</p>
<ul>
<li>
<p>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-pvc-2/igt@xe_waitfence@abstime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126549v2/bat-pvc-2/igt@xe_waitfence@abstime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/407">Intel XE#407</a>) +2 other tests fail</p>
</li>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-dg2-oem2/igt@xe_waitfence@abstime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126549v2/bat-dg2-oem2/igt@xe_waitfence@abstime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/407">Intel XE#407</a>) +1 other test fail</p>
</li>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-adlp-7/igt@xe_waitfence@abstime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126549v2/bat-adlp-7/igt@xe_waitfence@abstime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/407">Intel XE#407</a>) +1 other test fail</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/939">Intel XE#939</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126549v2/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html">PASS</a></p>
</li>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/939">Intel XE#939</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126549v2/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126549v2/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_guc_pc@freq_basic_api:</p>
<ul>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-adlp-7/igt@xe_guc_pc@freq_basic_api.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/935">Intel XE#935</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126549v2/bat-adlp-7/igt@xe_guc_pc@freq_basic_api.html">PASS</a></p>
</li>
<li>
<p>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-pvc-2/igt@xe_guc_pc@freq_basic_api.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/935">Intel XE#935</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126549v2/bat-pvc-2/igt@xe_guc_pc@freq_basic_api.html">PASS</a></p>
</li>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-dg2-oem2/igt@xe_guc_pc@freq_basic_api.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/935">Intel XE#935</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126549v2/bat-dg2-oem2/igt@xe_guc_pc@freq_basic_api.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@xe_guc_pc@freq_fixed_idle:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-dg2-oem2/igt@xe_guc_pc@freq_fixed_idle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/940">Intel XE#940</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126549v2/bat-dg2-oem2/igt@xe_guc_pc@freq_fixed_idle.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_guc_pc@freq_range_idle:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-adlp-7/igt@xe_guc_pc@freq_range_idle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/940">Intel XE#940</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126549v2/bat-adlp-7/igt@xe_guc_pc@freq_range_idle.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-515-a9ee4928479a5449991149cc38747e8e20376db9 -&gt; xe-pw-126549v2</li>
</ul>
<p>IGT_7595: cfa00d99b1dfa0621ea552d1ed54907798da1a1a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-515-a9ee4928479a5449991149cc38747e8e20376db9: a9ee4928479a5449991149cc38747e8e20376db9<br />
  xe-pw-126549v2: 126549v2</p>

</body>
</html>

--===============5518316970781602239==--
