Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2134EEC875E
	for <intel-xe@archiver.kernel.org>; Fri,  8 Sep 2023 02:02:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B72E710E073;
	Fri,  8 Sep 2023 02:02:09 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 35A5110E073;
 Fri,  8 Sep 2023 02:02:08 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 373EEAADE3;
 Fri,  8 Sep 2023 02:02:08 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6551772606935797944=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Date: Fri, 08 Sep 2023 02:02:08 -0000
Message-ID: <169413852818.14897.3129618041476468535@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230907193515.7-1-francois.dugast@intel.com>
In-Reply-To: <20230907193515.7-1-francois.dugast@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_drm/xe/ua?=
 =?utf-8?q?pi=3A_Remove_MMIO_ioctl?=
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

--===============6551772606935797944==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/uapi: Remove MMIO ioctl
URL   : https://patchwork.freedesktop.org/series/123403/
State : failure

== Summary ==

CI Bug Log - changes from xe-362-758f01ec2a6774fda1e8f8075d31f42b81783caf_BAT -> xe-pw-123403v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-123403v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-123403v1_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-123403v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_pipe_crc_basic@read-crc@pipe-b-dp-3:
    - bat-dg2-oem2:       [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-362-758f01ec2a6774fda1e8f8075d31f42b81783caf/bat-dg2-oem2/igt@kms_pipe_crc_basic@read-crc@pipe-b-dp-3.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123403v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@read-crc@pipe-b-dp-3.html

  * igt@xe_evict@evict-mixed-threads-small:
    - bat-atsm-2:         [PASS][3] -> [TIMEOUT][4] +2 other tests timeout
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-362-758f01ec2a6774fda1e8f8075d31f42b81783caf/bat-atsm-2/igt@xe_evict@evict-mixed-threads-small.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123403v1/bat-atsm-2/igt@xe_evict@evict-mixed-threads-small.html

  * igt@xe_evict@evict-mixed-threads-small-multi-vm:
    - bat-dg2-oem2:       [PASS][5] -> [TIMEOUT][6] +2 other tests timeout
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-362-758f01ec2a6774fda1e8f8075d31f42b81783caf/bat-dg2-oem2/igt@xe_evict@evict-mixed-threads-small-multi-vm.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123403v1/bat-dg2-oem2/igt@xe_evict@evict-mixed-threads-small-multi-vm.html

  * igt@xe_exec_compute_mode@twice-basic:
    - bat-adlp-7:         [PASS][7] -> [FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-362-758f01ec2a6774fda1e8f8075d31f42b81783caf/bat-adlp-7/igt@xe_exec_compute_mode@twice-basic.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123403v1/bat-adlp-7/igt@xe_exec_compute_mode@twice-basic.html

  * igt@xe_exec_compute_mode@twice-preempt-fence-early:
    - bat-dg2-oem2:       [PASS][9] -> [FAIL][10] +26 other tests fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-362-758f01ec2a6774fda1e8f8075d31f42b81783caf/bat-dg2-oem2/igt@xe_exec_compute_mode@twice-preempt-fence-early.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123403v1/bat-dg2-oem2/igt@xe_exec_compute_mode@twice-preempt-fence-early.html
    - bat-adlp-7:         [PASS][11] -> [DMESG-FAIL][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-362-758f01ec2a6774fda1e8f8075d31f42b81783caf/bat-adlp-7/igt@xe_exec_compute_mode@twice-preempt-fence-early.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123403v1/bat-adlp-7/igt@xe_exec_compute_mode@twice-preempt-fence-early.html

  * igt@xe_exec_compute_mode@twice-userptr-invalidate:
    - bat-atsm-2:         [PASS][13] -> [FAIL][14] +26 other tests fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-362-758f01ec2a6774fda1e8f8075d31f42b81783caf/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123403v1/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html

  
#### Warnings ####

  * igt@kms_addfb_basic@small-bo:
    - bat-atsm-2:         [SKIP][15] ([i915#6077]) -> [INCOMPLETE][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-362-758f01ec2a6774fda1e8f8075d31f42b81783caf/bat-atsm-2/igt@kms_addfb_basic@small-bo.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123403v1/bat-atsm-2/igt@kms_addfb_basic@small-bo.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@xe_evict@evict-mixed-threads-small-multi-vm:
    - {bat-pvc-2}:        [PASS][17] -> [TIMEOUT][18] +2 other tests timeout
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-362-758f01ec2a6774fda1e8f8075d31f42b81783caf/bat-pvc-2/igt@xe_evict@evict-mixed-threads-small-multi-vm.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123403v1/bat-pvc-2/igt@xe_evict@evict-mixed-threads-small-multi-vm.html

  * igt@xe_evict@evict-small-cm:
    - {bat-pvc-2}:        [DMESG-FAIL][19] ([Intel XE#482]) -> [FAIL][20] +3 other tests fail
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-362-758f01ec2a6774fda1e8f8075d31f42b81783caf/bat-pvc-2/igt@xe_evict@evict-small-cm.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123403v1/bat-pvc-2/igt@xe_evict@evict-small-cm.html

  * {igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate}:
    - bat-dg2-oem2:       [PASS][21] -> [FAIL][22] +4 other tests fail
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-362-758f01ec2a6774fda1e8f8075d31f42b81783caf/bat-dg2-oem2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123403v1/bat-dg2-oem2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html

  * {igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-rebind}:
    - bat-atsm-2:         [PASS][23] -> [FAIL][24] +4 other tests fail
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-362-758f01ec2a6774fda1e8f8075d31f42b81783caf/bat-atsm-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-rebind.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123403v1/bat-atsm-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:
    - {bat-pvc-2}:        [PASS][25] -> [FAIL][26] +59 other tests fail
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-362-758f01ec2a6774fda1e8f8075d31f42b81783caf/bat-pvc-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123403v1/bat-pvc-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html

  
Known issues
------------

  Here are the changes found in xe-pw-123403v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_pipe_crc_basic@read-crc:
    - bat-dg2-oem2:       [PASS][27] -> [INCOMPLETE][28] ([Intel XE#545])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-362-758f01ec2a6774fda1e8f8075d31f42b81783caf/bat-dg2-oem2/igt@kms_pipe_crc_basic@read-crc.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123403v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@read-crc.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/407
  [Intel XE#482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/482
  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524
  [Intel XE#545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/545
  [i915#6077]: https://gitlab.freedesktop.org/drm/intel/issues/6077


Build changes
-------------

  * Linux: xe-362-758f01ec2a6774fda1e8f8075d31f42b81783caf -> xe-pw-123403v1

  IGT_7474: 9d91cf2c6e7bb64d60c2030d1535e40ca0ad53ee @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-362-758f01ec2a6774fda1e8f8075d31f42b81783caf: 758f01ec2a6774fda1e8f8075d31f42b81783caf
  xe-pw-123403v1: 123403v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123403v1/index.html

--===============6551772606935797944==
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
<tr><td><b>Series:</b></td><td>drm/xe/uapi: Remove MMIO ioctl</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/123403/">https://patchwork.freedesktop.org/series/123403/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123403v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123403v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-362-758f01ec2a6774fda1e8f8075d31f42b81783caf_BAT -&gt; xe-pw-123403v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-123403v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-123403v1_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-123403v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-b-dp-3:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-362-758f01ec2a6774fda1e8f8075d31f42b81783caf/bat-dg2-oem2/igt@kms_pipe_crc_basic@read-crc@pipe-b-dp-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123403v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@read-crc@pipe-b-dp-3.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-small:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-362-758f01ec2a6774fda1e8f8075d31f42b81783caf/bat-atsm-2/igt@xe_evict@evict-mixed-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123403v1/bat-atsm-2/igt@xe_evict@evict-mixed-threads-small.html">TIMEOUT</a> +2 other tests timeout</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-small-multi-vm:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-362-758f01ec2a6774fda1e8f8075d31f42b81783caf/bat-dg2-oem2/igt@xe_evict@evict-mixed-threads-small-multi-vm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123403v1/bat-dg2-oem2/igt@xe_evict@evict-mixed-threads-small-multi-vm.html">TIMEOUT</a> +2 other tests timeout</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-362-758f01ec2a6774fda1e8f8075d31f42b81783caf/bat-adlp-7/igt@xe_exec_compute_mode@twice-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123403v1/bat-adlp-7/igt@xe_exec_compute_mode@twice-basic.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-preempt-fence-early:</p>
<ul>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-362-758f01ec2a6774fda1e8f8075d31f42b81783caf/bat-dg2-oem2/igt@xe_exec_compute_mode@twice-preempt-fence-early.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123403v1/bat-dg2-oem2/igt@xe_exec_compute_mode@twice-preempt-fence-early.html">FAIL</a> +26 other tests fail</p>
</li>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-362-758f01ec2a6774fda1e8f8075d31f42b81783caf/bat-adlp-7/igt@xe_exec_compute_mode@twice-preempt-fence-early.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123403v1/bat-adlp-7/igt@xe_exec_compute_mode@twice-preempt-fence-early.html">DMESG-FAIL</a></p>
</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-userptr-invalidate:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-362-758f01ec2a6774fda1e8f8075d31f42b81783caf/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123403v1/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html">FAIL</a> +26 other tests fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_addfb_basic@small-bo:<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-362-758f01ec2a6774fda1e8f8075d31f42b81783caf/bat-atsm-2/igt@kms_addfb_basic@small-bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6077">i915#6077</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123403v1/bat-atsm-2/igt@kms_addfb_basic@small-bo.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@xe_evict@evict-mixed-threads-small-multi-vm:</p>
<ul>
<li>{bat-pvc-2}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-362-758f01ec2a6774fda1e8f8075d31f42b81783caf/bat-pvc-2/igt@xe_evict@evict-mixed-threads-small-multi-vm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123403v1/bat-pvc-2/igt@xe_evict@evict-mixed-threads-small-multi-vm.html">TIMEOUT</a> +2 other tests timeout</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-cm:</p>
<ul>
<li>{bat-pvc-2}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-362-758f01ec2a6774fda1e8f8075d31f42b81783caf/bat-pvc-2/igt@xe_evict@evict-small-cm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/482">Intel XE#482</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123403v1/bat-pvc-2/igt@xe_evict@evict-small-cm.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate}:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-362-758f01ec2a6774fda1e8f8075d31f42b81783caf/bat-dg2-oem2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123403v1/bat-dg2-oem2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html">FAIL</a> +4 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-rebind}:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-362-758f01ec2a6774fda1e8f8075d31f42b81783caf/bat-atsm-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123403v1/bat-atsm-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-rebind.html">FAIL</a> +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:</p>
<ul>
<li>{bat-pvc-2}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-362-758f01ec2a6774fda1e8f8075d31f42b81783caf/bat-pvc-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123403v1/bat-pvc-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">FAIL</a> +59 other tests fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-123403v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_pipe_crc_basic@read-crc:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-362-758f01ec2a6774fda1e8f8075d31f42b81783caf/bat-dg2-oem2/igt@kms_pipe_crc_basic@read-crc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123403v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@read-crc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/545">Intel XE#545</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-362-758f01ec2a6774fda1e8f8075d31f42b81783caf -&gt; xe-pw-123403v1</li>
</ul>
<p>IGT_7474: 9d91cf2c6e7bb64d60c2030d1535e40ca0ad53ee @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-362-758f01ec2a6774fda1e8f8075d31f42b81783caf: 758f01ec2a6774fda1e8f8075d31f42b81783caf<br />
  xe-pw-123403v1: 123403v1</p>

</body>
</html>

--===============6551772606935797944==--
