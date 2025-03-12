Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5C9CC28B28
	for <intel-xe@archiver.kernel.org>; Wed, 12 Mar 2025 22:06:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74AA210E7CB;
	Wed, 12 Mar 2025 22:06:52 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 278F610E7CB;
 Wed, 12 Mar 2025 22:06:51 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3565118432043913959=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm=2C_drm/xe=3A_Multi-devi?=
 =?utf-8?q?ce_GPUSVM?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 12 Mar 2025 22:06:51 -0000
Message-ID: <174181721115.26945.17703584220347761600@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250312210416.3120-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20250312210416.3120-1-thomas.hellstrom@linux.intel.com>
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

--===============3565118432043913959==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm, drm/xe: Multi-device GPUSVM
URL   : https://patchwork.freedesktop.org/series/146227/
State : failure

== Summary ==

CI Bug Log - changes from xe-2806-e2e6ad67ea058d5b08490a2b3dab2152fcfcc24e_BAT -> xe-pw-146227v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-146227v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-146227v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (10 -> 9)
------------------------------

  Missing    (1): bat-adlp-vm 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-146227v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_compute-instance-0-tile-0-system-memory:
    - bat-lnl-1:          [PASS][1] -> [FAIL][2] +11 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2806-e2e6ad67ea058d5b08490a2b3dab2152fcfcc24e/bat-lnl-1/igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_compute-instance-0-tile-0-system-memory.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146227v1/bat-lnl-1/igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_compute-instance-0-tile-0-system-memory.html

  * igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_video_enhance-instance-0-tile-1-system-memory:
    - bat-lnl-2:          [PASS][3] -> [FAIL][4] +11 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2806-e2e6ad67ea058d5b08490a2b3dab2152fcfcc24e/bat-lnl-2/igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_video_enhance-instance-0-tile-1-system-memory.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146227v1/bat-lnl-2/igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_video_enhance-instance-0-tile-1-system-memory.html

  * igt@xe_pat@pat-index-all:
    - bat-adlp-vf:        NOTRUN -> [ABORT][5]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146227v1/bat-adlp-vf/igt@xe_pat@pat-index-all.html
    - bat-lnl-1:          [PASS][6] -> [ABORT][7]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2806-e2e6ad67ea058d5b08490a2b3dab2152fcfcc24e/bat-lnl-1/igt@xe_pat@pat-index-all.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146227v1/bat-lnl-1/igt@xe_pat@pat-index-all.html
    - bat-pvc-2:          [PASS][8] -> [ABORT][9]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2806-e2e6ad67ea058d5b08490a2b3dab2152fcfcc24e/bat-pvc-2/igt@xe_pat@pat-index-all.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146227v1/bat-pvc-2/igt@xe_pat@pat-index-all.html
    - bat-bmg-2:          [PASS][10] -> [ABORT][11]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2806-e2e6ad67ea058d5b08490a2b3dab2152fcfcc24e/bat-bmg-2/igt@xe_pat@pat-index-all.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146227v1/bat-bmg-2/igt@xe_pat@pat-index-all.html
    - bat-bmg-1:          [PASS][12] -> [ABORT][13]
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2806-e2e6ad67ea058d5b08490a2b3dab2152fcfcc24e/bat-bmg-1/igt@xe_pat@pat-index-all.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146227v1/bat-bmg-1/igt@xe_pat@pat-index-all.html
    - bat-adlp-7:         [PASS][14] -> [ABORT][15]
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2806-e2e6ad67ea058d5b08490a2b3dab2152fcfcc24e/bat-adlp-7/igt@xe_pat@pat-index-all.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146227v1/bat-adlp-7/igt@xe_pat@pat-index-all.html
    - bat-lnl-2:          [PASS][16] -> [ABORT][17]
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2806-e2e6ad67ea058d5b08490a2b3dab2152fcfcc24e/bat-lnl-2/igt@xe_pat@pat-index-all.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146227v1/bat-lnl-2/igt@xe_pat@pat-index-all.html
    - bat-dg2-oem2:       [PASS][18] -> [ABORT][19]
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2806-e2e6ad67ea058d5b08490a2b3dab2152fcfcc24e/bat-dg2-oem2/igt@xe_pat@pat-index-all.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146227v1/bat-dg2-oem2/igt@xe_pat@pat-index-all.html
    - bat-atsm-2:         [PASS][20] -> [ABORT][21]
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2806-e2e6ad67ea058d5b08490a2b3dab2152fcfcc24e/bat-atsm-2/igt@xe_pat@pat-index-all.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146227v1/bat-atsm-2/igt@xe_pat@pat-index-all.html

  
Known issues
------------

  Here are the changes found in xe-pw-146227v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_gt_freq@freq_fixed_idle:
    - bat-adlp-vf:        NOTRUN -> [SKIP][22] ([Intel XE#2464]) +2 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146227v1/bat-adlp-vf/igt@xe_gt_freq@freq_fixed_idle.html

  * igt@xe_mmap@vram:
    - bat-adlp-vf:        NOTRUN -> [SKIP][23] ([Intel XE#1008])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146227v1/bat-adlp-vf/igt@xe_mmap@vram.html

  * igt@xe_pm_residency@gt-c6-on-idle:
    - bat-adlp-vf:        NOTRUN -> [SKIP][24] ([Intel XE#2468])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146227v1/bat-adlp-vf/igt@xe_pm_residency@gt-c6-on-idle.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - bat-adlp-vf:        NOTRUN -> [SKIP][25] ([Intel XE#3342])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146227v1/bat-adlp-vf/igt@xe_sriov_flr@flr-vf1-clear.html

  
#### Possible fixes ####

  * igt@xe_exec_basic@twice-bindexecqueue-rebind:
    - bat-adlp-vf:        [ABORT][26] ([Intel XE#4491]) -> [PASS][27]
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2806-e2e6ad67ea058d5b08490a2b3dab2152fcfcc24e/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-rebind.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146227v1/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-rebind.html

  
  [Intel XE#1008]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008
  [Intel XE#2464]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2464
  [Intel XE#2468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2468
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#4491]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4491


Build changes
-------------

  * Linux: xe-2806-e2e6ad67ea058d5b08490a2b3dab2152fcfcc24e -> xe-pw-146227v1

  IGT_8272: 53d92c76fc719a27fedf0a407ca5a185094e702f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2806-e2e6ad67ea058d5b08490a2b3dab2152fcfcc24e: e2e6ad67ea058d5b08490a2b3dab2152fcfcc24e
  xe-pw-146227v1: 146227v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146227v1/index.html

--===============3565118432043913959==
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
<tr><td><b>Series:</b></td><td>drm, drm/xe: Multi-device GPUSVM</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/146227/">https://patchwork.freedesktop.org/series/146227/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146227v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146227v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2806-e2e6ad67ea058d5b08490a2b3dab2152fcfcc24e_BAT -&gt; xe-pw-146227v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-146227v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-146227v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (10 -&gt; 9)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-146227v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_compute-instance-0-tile-0-system-memory:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2806-e2e6ad67ea058d5b08490a2b3dab2152fcfcc24e/bat-lnl-1/igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_compute-instance-0-tile-0-system-memory.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146227v1/bat-lnl-1/igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_compute-instance-0-tile-0-system-memory.html">FAIL</a> +11 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_video_enhance-instance-0-tile-1-system-memory:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2806-e2e6ad67ea058d5b08490a2b3dab2152fcfcc24e/bat-lnl-2/igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_video_enhance-instance-0-tile-1-system-memory.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146227v1/bat-lnl-2/igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_video_enhance-instance-0-tile-1-system-memory.html">FAIL</a> +11 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-all:</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146227v1/bat-adlp-vf/igt@xe_pat@pat-index-all.html">ABORT</a></li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2806-e2e6ad67ea058d5b08490a2b3dab2152fcfcc24e/bat-lnl-1/igt@xe_pat@pat-index-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146227v1/bat-lnl-1/igt@xe_pat@pat-index-all.html">ABORT</a></li>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2806-e2e6ad67ea058d5b08490a2b3dab2152fcfcc24e/bat-pvc-2/igt@xe_pat@pat-index-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146227v1/bat-pvc-2/igt@xe_pat@pat-index-all.html">ABORT</a></li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2806-e2e6ad67ea058d5b08490a2b3dab2152fcfcc24e/bat-bmg-2/igt@xe_pat@pat-index-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146227v1/bat-bmg-2/igt@xe_pat@pat-index-all.html">ABORT</a></li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2806-e2e6ad67ea058d5b08490a2b3dab2152fcfcc24e/bat-bmg-1/igt@xe_pat@pat-index-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146227v1/bat-bmg-1/igt@xe_pat@pat-index-all.html">ABORT</a></li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2806-e2e6ad67ea058d5b08490a2b3dab2152fcfcc24e/bat-adlp-7/igt@xe_pat@pat-index-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146227v1/bat-adlp-7/igt@xe_pat@pat-index-all.html">ABORT</a></li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2806-e2e6ad67ea058d5b08490a2b3dab2152fcfcc24e/bat-lnl-2/igt@xe_pat@pat-index-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146227v1/bat-lnl-2/igt@xe_pat@pat-index-all.html">ABORT</a></li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2806-e2e6ad67ea058d5b08490a2b3dab2152fcfcc24e/bat-dg2-oem2/igt@xe_pat@pat-index-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146227v1/bat-dg2-oem2/igt@xe_pat@pat-index-all.html">ABORT</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2806-e2e6ad67ea058d5b08490a2b3dab2152fcfcc24e/bat-atsm-2/igt@xe_pat@pat-index-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146227v1/bat-atsm-2/igt@xe_pat@pat-index-all.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-146227v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_gt_freq@freq_fixed_idle:</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146227v1/bat-adlp-vf/igt@xe_gt_freq@freq_fixed_idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2464">Intel XE#2464</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146227v1/bat-adlp-vf/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008">Intel XE#1008</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-on-idle:</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146227v1/bat-adlp-vf/igt@xe_pm_residency@gt-c6-on-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2468">Intel XE#2468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146227v1/bat-adlp-vf/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_exec_basic@twice-bindexecqueue-rebind:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2806-e2e6ad67ea058d5b08490a2b3dab2152fcfcc24e/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4491">Intel XE#4491</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146227v1/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-rebind.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2806-e2e6ad67ea058d5b08490a2b3dab2152fcfcc24e -&gt; xe-pw-146227v1</li>
</ul>
<p>IGT_8272: 53d92c76fc719a27fedf0a407ca5a185094e702f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2806-e2e6ad67ea058d5b08490a2b3dab2152fcfcc24e: e2e6ad67ea058d5b08490a2b3dab2152fcfcc24e<br />
  xe-pw-146227v1: 146227v1</p>

</body>
</html>

--===============3565118432043913959==--
