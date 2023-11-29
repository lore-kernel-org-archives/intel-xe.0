Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55555C4167B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 19:55:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17EDC10E079;
	Wed, 29 Nov 2023 19:55:31 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id ECE9C10E079;
 Wed, 29 Nov 2023 19:55:29 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id E5EADAADDD;
 Wed, 29 Nov 2023 19:55:29 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8040658267759260544=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Date: Wed, 29 Nov 2023 19:55:29 -0000
Message-ID: <170128772990.12090.4465252132798974392@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231129164115.18384-1-rodrigo.vivi@intel.com>
In-Reply-To: <20231129164115.18384-1-rodrigo.vivi@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_drm/xe/ua?=
 =?utf-8?q?pi=3A_Kill_exec=5Fqueue=5Fset=5Fproperty?=
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

--===============8040658267759260544==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/uapi: Kill exec_queue_set_property
URL   : https://patchwork.freedesktop.org/series/127064/
State : failure

== Summary ==

CI Bug Log - changes from xe-534-c6dd07d0c40b5906cdd9dffe8335a772bbd24bd1_BAT -> xe-pw-127064v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-127064v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-127064v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-127064v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:
    - bat-pvc-2:          [PASS][1] -> [TIMEOUT][2] +2 other tests timeout
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-534-c6dd07d0c40b5906cdd9dffe8335a772bbd24bd1/bat-pvc-2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127064v1/bat-pvc-2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html
    - bat-dg2-oem2:       [PASS][3] -> [TIMEOUT][4] +2 other tests timeout
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-534-c6dd07d0c40b5906cdd9dffe8335a772bbd24bd1/bat-dg2-oem2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127064v1/bat-dg2-oem2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html

  * igt@xe_evict@evict-mixed-threads-small:
    - bat-atsm-2:         [PASS][5] -> [TIMEOUT][6] +2 other tests timeout
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-534-c6dd07d0c40b5906cdd9dffe8335a772bbd24bd1/bat-atsm-2/igt@xe_evict@evict-mixed-threads-small.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127064v1/bat-atsm-2/igt@xe_evict@evict-mixed-threads-small.html

  * igt@xe_exec_balancer@twice-cm-virtual-userptr-rebind:
    - bat-pvc-2:          [PASS][7] -> [FAIL][8] +19 other tests fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-534-c6dd07d0c40b5906cdd9dffe8335a772bbd24bd1/bat-pvc-2/igt@xe_exec_balancer@twice-cm-virtual-userptr-rebind.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127064v1/bat-pvc-2/igt@xe_exec_balancer@twice-cm-virtual-userptr-rebind.html

  * igt@xe_exec_compute_mode@twice-preempt-fence-early:
    - bat-adlp-7:         [PASS][9] -> [FAIL][10] +11 other tests fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-534-c6dd07d0c40b5906cdd9dffe8335a772bbd24bd1/bat-adlp-7/igt@xe_exec_compute_mode@twice-preempt-fence-early.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127064v1/bat-adlp-7/igt@xe_exec_compute_mode@twice-preempt-fence-early.html

  * igt@xe_exec_compute_mode@twice-userptr-invalidate:
    - bat-atsm-2:         [PASS][11] -> [FAIL][12] +23 other tests fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-534-c6dd07d0c40b5906cdd9dffe8335a772bbd24bd1/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127064v1/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html

  * igt@xe_exec_threads@threads-mixed-userptr-invalidate:
    - bat-dg2-oem2:       [PASS][13] -> [FAIL][14] +23 other tests fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-534-c6dd07d0c40b5906cdd9dffe8335a772bbd24bd1/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127064v1/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html

  
#### Warnings ####

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:
    - bat-dg2-oem2:       [FAIL][15] ([Intel XE#400] / [Intel XE#616]) -> [INCOMPLETE][16] +1 other test incomplete
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-534-c6dd07d0c40b5906cdd9dffe8335a772bbd24bd1/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127064v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html

  * igt@xe_evict@evict-beng-small-cm:
    - bat-pvc-2:          [DMESG-FAIL][17] ([Intel XE#482]) -> [FAIL][18] +3 other tests fail
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-534-c6dd07d0c40b5906cdd9dffe8335a772bbd24bd1/bat-pvc-2/igt@xe_evict@evict-beng-small-cm.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127064v1/bat-pvc-2/igt@xe_evict@evict-beng-small-cm.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@xe_exec_compute_mode@twice-bindexecqueue-rebind}:
    - bat-atsm-2:         [PASS][19] -> [FAIL][20] +5 other tests fail
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-534-c6dd07d0c40b5906cdd9dffe8335a772bbd24bd1/bat-atsm-2/igt@xe_exec_compute_mode@twice-bindexecqueue-rebind.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127064v1/bat-atsm-2/igt@xe_exec_compute_mode@twice-bindexecqueue-rebind.html

  * {igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate}:
    - bat-pvc-2:          [PASS][21] -> [FAIL][22] +5 other tests fail
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-534-c6dd07d0c40b5906cdd9dffe8335a772bbd24bd1/bat-pvc-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127064v1/bat-pvc-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html
    - bat-adlp-7:         [PASS][23] -> [FAIL][24] +5 other tests fail
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-534-c6dd07d0c40b5906cdd9dffe8335a772bbd24bd1/bat-adlp-7/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127064v1/bat-adlp-7/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html

  * {igt@xe_waitfence@engine}:
    - bat-dg2-oem2:       [PASS][25] -> [FAIL][26] +5 other tests fail
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-534-c6dd07d0c40b5906cdd9dffe8335a772bbd24bd1/bat-dg2-oem2/igt@xe_waitfence@engine.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127064v1/bat-dg2-oem2/igt@xe_waitfence@engine.html

  
Known issues
------------

  Here are the changes found in xe-pw-127064v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-atsm-2:         [PASS][27] -> [INCOMPLETE][28] ([Intel XE#764])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-534-c6dd07d0c40b5906cdd9dffe8335a772bbd24bd1/bat-atsm-2/igt@core_hotunplug@unbind-rebind.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127064v1/bat-atsm-2/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3:
    - bat-dg2-oem2:       [PASS][29] -> [FAIL][30] ([Intel XE#480]) +1 other test fail
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-534-c6dd07d0c40b5906cdd9dffe8335a772bbd24bd1/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127064v1/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [PASS][31] -> [DMESG-WARN][32] ([Intel XE#282] / [i915#2017])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-534-c6dd07d0c40b5906cdd9dffe8335a772bbd24bd1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127064v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  * igt@xe_waitfence@abstime:
    - bat-pvc-2:          [PASS][33] -> [FAIL][34] ([Intel XE#407]) +1 other test fail
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-534-c6dd07d0c40b5906cdd9dffe8335a772bbd24bd1/bat-pvc-2/igt@xe_waitfence@abstime.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127064v1/bat-pvc-2/igt@xe_waitfence@abstime.html
    - bat-adlp-7:         [PASS][35] -> [FAIL][36] ([Intel XE#407]) +1 other test fail
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-534-c6dd07d0c40b5906cdd9dffe8335a772bbd24bd1/bat-adlp-7/igt@xe_waitfence@abstime.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127064v1/bat-adlp-7/igt@xe_waitfence@abstime.html
    - bat-dg2-oem2:       [PASS][37] -> [FAIL][38] ([Intel XE#407]) +1 other test fail
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-534-c6dd07d0c40b5906cdd9dffe8335a772bbd24bd1/bat-dg2-oem2/igt@xe_waitfence@abstime.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127064v1/bat-dg2-oem2/igt@xe_waitfence@abstime.html
    - bat-atsm-2:         [PASS][39] -> [FAIL][40] ([Intel XE#407]) +1 other test fail
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-534-c6dd07d0c40b5906cdd9dffe8335a772bbd24bd1/bat-atsm-2/igt@xe_waitfence@abstime.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127064v1/bat-atsm-2/igt@xe_waitfence@abstime.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
  [Intel XE#400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/400
  [Intel XE#407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/407
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/482
  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#764]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/764
  [i915#2017]: https://gitlab.freedesktop.org/drm/intel/issues/2017


Build changes
-------------

  * Linux: xe-534-c6dd07d0c40b5906cdd9dffe8335a772bbd24bd1 -> xe-pw-127064v1

  IGT_7610: 7610
  xe-534-c6dd07d0c40b5906cdd9dffe8335a772bbd24bd1: c6dd07d0c40b5906cdd9dffe8335a772bbd24bd1
  xe-pw-127064v1: 127064v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127064v1/index.html

--===============8040658267759260544==
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
<tr><td><b>Series:</b></td><td>drm/xe/uapi: Kill exec_queue_set_property</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/127064/">https://patchwork.freedesktop.org/series/127064/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127064v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127064v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-534-c6dd07d0c40b5906cdd9dffe8335a772bbd24bd1_BAT -&gt; xe-pw-127064v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-127064v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-127064v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-127064v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:</p>
<ul>
<li>
<p>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-534-c6dd07d0c40b5906cdd9dffe8335a772bbd24bd1/bat-pvc-2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127064v1/bat-pvc-2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">TIMEOUT</a> +2 other tests timeout</p>
</li>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-534-c6dd07d0c40b5906cdd9dffe8335a772bbd24bd1/bat-dg2-oem2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127064v1/bat-dg2-oem2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">TIMEOUT</a> +2 other tests timeout</p>
</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-small:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-534-c6dd07d0c40b5906cdd9dffe8335a772bbd24bd1/bat-atsm-2/igt@xe_evict@evict-mixed-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127064v1/bat-atsm-2/igt@xe_evict@evict-mixed-threads-small.html">TIMEOUT</a> +2 other tests timeout</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-cm-virtual-userptr-rebind:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-534-c6dd07d0c40b5906cdd9dffe8335a772bbd24bd1/bat-pvc-2/igt@xe_exec_balancer@twice-cm-virtual-userptr-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127064v1/bat-pvc-2/igt@xe_exec_balancer@twice-cm-virtual-userptr-rebind.html">FAIL</a> +19 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-preempt-fence-early:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-534-c6dd07d0c40b5906cdd9dffe8335a772bbd24bd1/bat-adlp-7/igt@xe_exec_compute_mode@twice-preempt-fence-early.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127064v1/bat-adlp-7/igt@xe_exec_compute_mode@twice-preempt-fence-early.html">FAIL</a> +11 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-userptr-invalidate:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-534-c6dd07d0c40b5906cdd9dffe8335a772bbd24bd1/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127064v1/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html">FAIL</a> +23 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-userptr-invalidate:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-534-c6dd07d0c40b5906cdd9dffe8335a772bbd24bd1/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127064v1/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html">FAIL</a> +23 other tests fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-534-c6dd07d0c40b5906cdd9dffe8335a772bbd24bd1/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/400">Intel XE#400</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127064v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-cm:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-534-c6dd07d0c40b5906cdd9dffe8335a772bbd24bd1/bat-pvc-2/igt@xe_evict@evict-beng-small-cm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/482">Intel XE#482</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127064v1/bat-pvc-2/igt@xe_evict@evict-beng-small-cm.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@xe_exec_compute_mode@twice-bindexecqueue-rebind}:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-534-c6dd07d0c40b5906cdd9dffe8335a772bbd24bd1/bat-atsm-2/igt@xe_exec_compute_mode@twice-bindexecqueue-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127064v1/bat-atsm-2/igt@xe_exec_compute_mode@twice-bindexecqueue-rebind.html">FAIL</a> +5 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate}:</p>
<ul>
<li>
<p>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-534-c6dd07d0c40b5906cdd9dffe8335a772bbd24bd1/bat-pvc-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127064v1/bat-pvc-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html">FAIL</a> +5 other tests fail</p>
</li>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-534-c6dd07d0c40b5906cdd9dffe8335a772bbd24bd1/bat-adlp-7/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127064v1/bat-adlp-7/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html">FAIL</a> +5 other tests fail</p>
</li>
</ul>
</li>
<li>
<p>{igt@xe_waitfence@engine}:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-534-c6dd07d0c40b5906cdd9dffe8335a772bbd24bd1/bat-dg2-oem2/igt@xe_waitfence@engine.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127064v1/bat-dg2-oem2/igt@xe_waitfence@engine.html">FAIL</a> +5 other tests fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-127064v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-534-c6dd07d0c40b5906cdd9dffe8335a772bbd24bd1/bat-atsm-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127064v1/bat-atsm-2/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/764">Intel XE#764</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-534-c6dd07d0c40b5906cdd9dffe8335a772bbd24bd1/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127064v1/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-534-c6dd07d0c40b5906cdd9dffe8335a772bbd24bd1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127064v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2017">i915#2017</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@abstime:</p>
<ul>
<li>
<p>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-534-c6dd07d0c40b5906cdd9dffe8335a772bbd24bd1/bat-pvc-2/igt@xe_waitfence@abstime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127064v1/bat-pvc-2/igt@xe_waitfence@abstime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/407">Intel XE#407</a>) +1 other test fail</p>
</li>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-534-c6dd07d0c40b5906cdd9dffe8335a772bbd24bd1/bat-adlp-7/igt@xe_waitfence@abstime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127064v1/bat-adlp-7/igt@xe_waitfence@abstime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/407">Intel XE#407</a>) +1 other test fail</p>
</li>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-534-c6dd07d0c40b5906cdd9dffe8335a772bbd24bd1/bat-dg2-oem2/igt@xe_waitfence@abstime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127064v1/bat-dg2-oem2/igt@xe_waitfence@abstime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/407">Intel XE#407</a>) +1 other test fail</p>
</li>
<li>
<p>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-534-c6dd07d0c40b5906cdd9dffe8335a772bbd24bd1/bat-atsm-2/igt@xe_waitfence@abstime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127064v1/bat-atsm-2/igt@xe_waitfence@abstime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/407">Intel XE#407</a>) +1 other test fail</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-534-c6dd07d0c40b5906cdd9dffe8335a772bbd24bd1 -&gt; xe-pw-127064v1</li>
</ul>
<p>IGT_7610: 7610<br />
  xe-534-c6dd07d0c40b5906cdd9dffe8335a772bbd24bd1: c6dd07d0c40b5906cdd9dffe8335a772bbd24bd1<br />
  xe-pw-127064v1: 127064v1</p>

</body>
</html>

--===============8040658267759260544==--
