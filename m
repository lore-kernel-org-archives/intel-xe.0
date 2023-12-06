Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3420DC4167B
	for <intel-xe@archiver.kernel.org>; Wed,  6 Dec 2023 08:21:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05D9D10E6BD;
	Wed,  6 Dec 2023 08:21:11 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id AE55910E6BD;
 Wed,  6 Dec 2023 08:21:08 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id A48FFAADD1;
 Wed,  6 Dec 2023 08:21:08 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5262517631645985905=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bommu Krishnaiah" <krishnaiah.bommu@intel.com>
Date: Wed, 06 Dec 2023 08:21:08 -0000
Message-ID: <170185086863.26423.14803989896274053944@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231206034130.7897-1-krishnaiah.bommu@intel.com>
In-Reply-To: <20231206034130.7897-1-krishnaiah.bommu@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_RFC=3A_dr?=
 =?utf-8?q?m/xe/uapi=3A_Return_correct_error_code_for_xe=5Fwait=5Fuser=5Ff?=
 =?utf-8?q?ence=5Fioctl_=28rev3=29?=
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

--===============5262517631645985905==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: RFC: drm/xe/uapi: Return correct error code for xe_wait_user_fence_ioctl (rev3)
URL   : https://patchwork.freedesktop.org/series/127365/
State : failure

== Summary ==

CI Bug Log - changes from xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a_BAT -> xe-pw-127365v3_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-127365v3_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-127365v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-127365v3_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:
    - bat-pvc-2:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a/bat-pvc-2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127365v3/bat-pvc-2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html
    - bat-dg2-oem2:       [PASS][3] -> [TIMEOUT][4] +2 other tests timeout
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a/bat-dg2-oem2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127365v3/bat-dg2-oem2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html

  * igt@xe_evict@evict-mixed-threads-small:
    - bat-atsm-2:         [PASS][5] -> [TIMEOUT][6] +2 other tests timeout
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a/bat-atsm-2/igt@xe_evict@evict-mixed-threads-small.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127365v3/bat-atsm-2/igt@xe_evict@evict-mixed-threads-small.html

  * igt@xe_exec_compute_mode@twice-preempt-fence-early:
    - bat-adlp-7:         [PASS][7] -> [FAIL][8] +18 other tests fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a/bat-adlp-7/igt@xe_exec_compute_mode@twice-preempt-fence-early.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127365v3/bat-adlp-7/igt@xe_exec_compute_mode@twice-preempt-fence-early.html

  * igt@xe_exec_compute_mode@twice-userptr-invalidate:
    - bat-atsm-2:         [PASS][9] -> [FAIL][10] +30 other tests fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127365v3/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html

  * igt@xe_waitfence@engine:
    - bat-dg2-oem2:       [PASS][11] -> [FAIL][12] +30 other tests fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a/bat-dg2-oem2/igt@xe_waitfence@engine.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127365v3/bat-dg2-oem2/igt@xe_waitfence@engine.html

  
#### Warnings ####

  * igt@xe_prime_self_import@basic-with_fd_dup:
    - bat-atsm-2:         [FAIL][13] ([Intel XE#999]) -> [FAIL][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a/bat-atsm-2/igt@xe_prime_self_import@basic-with_fd_dup.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127365v3/bat-atsm-2/igt@xe_prime_self_import@basic-with_fd_dup.html

  
Known issues
------------

  Here are the changes found in xe-pw-127365v3_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-atsm-2:         [PASS][15] -> [INCOMPLETE][16] ([Intel XE#764])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a/bat-atsm-2/igt@core_hotunplug@unbind-rebind.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127365v3/bat-atsm-2/igt@core_hotunplug@unbind-rebind.html

  * igt@xe_exec_reset@cm-close-fd-no-exec:
    - bat-adlp-7:         [PASS][17] -> [FAIL][18] ([Intel XE#818])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a/bat-adlp-7/igt@xe_exec_reset@cm-close-fd-no-exec.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127365v3/bat-adlp-7/igt@xe_exec_reset@cm-close-fd-no-exec.html
    - bat-dg2-oem2:       [PASS][19] -> [FAIL][20] ([Intel XE#818])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a/bat-dg2-oem2/igt@xe_exec_reset@cm-close-fd-no-exec.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127365v3/bat-dg2-oem2/igt@xe_exec_reset@cm-close-fd-no-exec.html

  * igt@xe_waitfence@abstime:
    - bat-atsm-2:         [PASS][21] -> [FAIL][22] ([Intel XE#826])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a/bat-atsm-2/igt@xe_waitfence@abstime.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127365v3/bat-atsm-2/igt@xe_waitfence@abstime.html

  
#### Warnings ####

  * igt@xe_prime_self_import@basic-with_one_bo:
    - bat-atsm-2:         [FAIL][23] -> [FAIL][24] ([Intel XE#999])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a/bat-atsm-2/igt@xe_prime_self_import@basic-with_one_bo.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127365v3/bat-atsm-2/igt@xe_prime_self_import@basic-with_one_bo.html

  
  [Intel XE#764]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/764
  [Intel XE#818]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/818
  [Intel XE#826]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/826
  [Intel XE#999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/999


Build changes
-------------

  * Linux: xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a -> xe-pw-127365v3

  IGT_7622: 48a47d91b7727215b965690c69d84159c8fb1aa2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a: 9d76164e08c68a3d5d081ff7b07c15a2cadf741a
  xe-pw-127365v3: 127365v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127365v3/index.html

--===============5262517631645985905==
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
<tr><td><b>Series:</b></td><td>RFC: drm/xe/uapi: Return correct error code for xe_wait_user_fence_ioctl (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/127365/">https://patchwork.freedesktop.org/series/127365/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127365v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127365v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a_BAT -&gt; xe-pw-127365v3_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-127365v3_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-127365v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-127365v3_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:</p>
<ul>
<li>
<p>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a/bat-pvc-2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127365v3/bat-pvc-2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">INCOMPLETE</a></p>
</li>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a/bat-dg2-oem2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127365v3/bat-dg2-oem2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">TIMEOUT</a> +2 other tests timeout</p>
</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-small:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a/bat-atsm-2/igt@xe_evict@evict-mixed-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127365v3/bat-atsm-2/igt@xe_evict@evict-mixed-threads-small.html">TIMEOUT</a> +2 other tests timeout</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-preempt-fence-early:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a/bat-adlp-7/igt@xe_exec_compute_mode@twice-preempt-fence-early.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127365v3/bat-adlp-7/igt@xe_exec_compute_mode@twice-preempt-fence-early.html">FAIL</a> +18 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-userptr-invalidate:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127365v3/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html">FAIL</a> +30 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@engine:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a/bat-dg2-oem2/igt@xe_waitfence@engine.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127365v3/bat-dg2-oem2/igt@xe_waitfence@engine.html">FAIL</a> +30 other tests fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_prime_self_import@basic-with_fd_dup:<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a/bat-atsm-2/igt@xe_prime_self_import@basic-with_fd_dup.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/999">Intel XE#999</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127365v3/bat-atsm-2/igt@xe_prime_self_import@basic-with_fd_dup.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-127365v3_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a/bat-atsm-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127365v3/bat-atsm-2/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/764">Intel XE#764</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-close-fd-no-exec:</p>
<ul>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a/bat-adlp-7/igt@xe_exec_reset@cm-close-fd-no-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127365v3/bat-adlp-7/igt@xe_exec_reset@cm-close-fd-no-exec.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/818">Intel XE#818</a>)</p>
</li>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a/bat-dg2-oem2/igt@xe_exec_reset@cm-close-fd-no-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127365v3/bat-dg2-oem2/igt@xe_exec_reset@cm-close-fd-no-exec.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/818">Intel XE#818</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@abstime:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a/bat-atsm-2/igt@xe_waitfence@abstime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127365v3/bat-atsm-2/igt@xe_waitfence@abstime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/826">Intel XE#826</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_prime_self_import@basic-with_one_bo:<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a/bat-atsm-2/igt@xe_prime_self_import@basic-with_one_bo.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127365v3/bat-atsm-2/igt@xe_prime_self_import@basic-with_one_bo.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/999">Intel XE#999</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a -&gt; xe-pw-127365v3</li>
</ul>
<p>IGT_7622: 48a47d91b7727215b965690c69d84159c8fb1aa2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a: 9d76164e08c68a3d5d081ff7b07c15a2cadf741a<br />
  xe-pw-127365v3: 127365v3</p>

</body>
</html>

--===============5262517631645985905==--
