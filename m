Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FF93C624D4
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 22:48:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF26310E062;
	Wed,  2 Sep 2026 22:48:06 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5051410E062;
 Wed,  2 Sep 2026 22:48:05 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============9023034711716436146=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/xe/pagefault=3A_Add_SRC?=
 =?utf-8?q?ID_to_pagefault_reporting_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jonathan Cavitt" <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 02 Sep 2026 22:48:05 -0000
Message-ID: <178838928532.115637.14603923878203133348@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260902212549.347805-1-jonathan.cavitt@intel.com>
In-Reply-To: <20260902212549.347805-1-jonathan.cavitt@intel.com>
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

--===============9023034711716436146==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/pagefault: Add SRCID to pagefault reporting (rev6)
URL   : https://patchwork.freedesktop.org/series/167334/
State : failure

== Summary ==

CI Bug Log - changes from xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3_BAT -> xe-pw-167334v6_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-167334v6_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-167334v6_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (13 -> 11)
------------------------------

  Missing    (2): bat-bmg-1 bat-nvls-1 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-167334v6_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_fault_mode@twice-bindexecqueue:
    - bat-wcl-2:          [PASS][1] -> [DMESG-FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/bat-wcl-2/igt@xe_exec_fault_mode@twice-bindexecqueue.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167334v6/bat-wcl-2/igt@xe_exec_fault_mode@twice-bindexecqueue.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr:
    - bat-ptl-2:          [PASS][3] -> [FAIL][4] +43 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/bat-ptl-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167334v6/bat-ptl-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate:
    - bat-wcl-2:          [PASS][5] -> [FAIL][6] +42 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/bat-wcl-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167334v6/bat-wcl-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch:
    - bat-lnl-1:          [PASS][7] -> [FAIL][8] +42 other tests fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/bat-lnl-1/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167334v6/bat-lnl-1/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate:
    - bat-wcl-1:          [PASS][9] -> [DMESG-FAIL][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/bat-wcl-1/igt@xe_exec_fault_mode@twice-userptr-invalidate.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167334v6/bat-wcl-1/igt@xe_exec_fault_mode@twice-userptr-invalidate.html
    - bat-ptl-1:          [PASS][11] -> [DMESG-FAIL][12] +1 other test dmesg-fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/bat-ptl-1/igt@xe_exec_fault_mode@twice-userptr-invalidate.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167334v6/bat-ptl-1/igt@xe_exec_fault_mode@twice-userptr-invalidate.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:
    - bat-lnl-2:          [PASS][13] -> [FAIL][14] +42 other tests fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/bat-lnl-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167334v6/bat-lnl-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html
    - bat-nvls-2:         [PASS][15] -> [FAIL][16] +43 other tests fail
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/bat-nvls-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167334v6/bat-nvls-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
    - bat-wcl-1:          [PASS][17] -> [FAIL][18] +42 other tests fail
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/bat-wcl-1/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167334v6/bat-wcl-1/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:
    - bat-ptl-2:          [PASS][19] -> [TIMEOUT][20]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/bat-ptl-2/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167334v6/bat-ptl-2/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html
    - bat-bmg-2:          [PASS][21] -> [TIMEOUT][22]
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/bat-bmg-2/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167334v6/bat-bmg-2/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html
    - bat-lnl-2:          [PASS][23] -> [TIMEOUT][24]
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/bat-lnl-2/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167334v6/bat-lnl-2/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html
    - bat-nvls-2:         [PASS][25] -> [TIMEOUT][26]
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/bat-nvls-2/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167334v6/bat-nvls-2/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html
    - bat-wcl-1:          [PASS][27] -> [TIMEOUT][28]
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/bat-wcl-1/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167334v6/bat-wcl-1/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html
    - bat-ptl-1:          [PASS][29] -> [TIMEOUT][30]
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/bat-ptl-1/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167334v6/bat-ptl-1/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html
    - bat-wcl-2:          [PASS][31] -> [TIMEOUT][32]
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/bat-wcl-2/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167334v6/bat-wcl-2/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html
    - bat-lnl-1:          [PASS][33] -> [TIMEOUT][34]
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/bat-lnl-1/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167334v6/bat-lnl-1/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html

  * igt@xe_exec_system_allocator@madvise-atomic-inc:
    - bat-bmg-2:          [PASS][35] -> [FAIL][36] +12 other tests fail
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/bat-bmg-2/igt@xe_exec_system_allocator@madvise-atomic-inc.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167334v6/bat-bmg-2/igt@xe_exec_system_allocator@madvise-atomic-inc.html

  * igt@xe_exec_system_allocator@once-malloc:
    - bat-ptl-1:          [PASS][37] -> [FAIL][38] +41 other tests fail
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/bat-ptl-1/igt@xe_exec_system_allocator@once-malloc.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167334v6/bat-ptl-1/igt@xe_exec_system_allocator@once-malloc.html

  * igt@xe_multigpu_svm@mgpu-latency-prefetch:
    - bat-bmg-3:          [PASS][39] -> [FAIL][40] +19 other tests fail
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/bat-bmg-3/igt@xe_multigpu_svm@mgpu-latency-prefetch.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167334v6/bat-bmg-3/igt@xe_multigpu_svm@mgpu-latency-prefetch.html

  * igt@xe_multigpu_svm@mgpu-migration-basic:
    - bat-bmg-3:          [PASS][41] -> [DMESG-FAIL][42]
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/bat-bmg-3/igt@xe_multigpu_svm@mgpu-migration-basic.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167334v6/bat-bmg-3/igt@xe_multigpu_svm@mgpu-migration-basic.html

  
Known issues
------------

  Here are the changes found in xe-pw-167334v6_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-ptl-2:          [PASS][43] -> [ABORT][44] ([Intel XE#8007])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/bat-ptl-2/igt@core_hotunplug@unbind-rebind.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167334v6/bat-ptl-2/igt@core_hotunplug@unbind-rebind.html
    - bat-lnl-2:          [PASS][45] -> [ABORT][46] ([Intel XE#8007])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/bat-lnl-2/igt@core_hotunplug@unbind-rebind.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167334v6/bat-lnl-2/igt@core_hotunplug@unbind-rebind.html
    - bat-ptl-1:          [PASS][47] -> [ABORT][48] ([Intel XE#8007])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/bat-ptl-1/igt@core_hotunplug@unbind-rebind.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167334v6/bat-ptl-1/igt@core_hotunplug@unbind-rebind.html
    - bat-lnl-1:          [PASS][49] -> [ABORT][50] ([Intel XE#8007])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167334v6/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html

  * igt@xe_exec_fault_mode@twice-basic-imm:
    - bat-lnl-2:          [PASS][51] -> [FAIL][52] ([Intel XE#8948])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/bat-lnl-2/igt@xe_exec_fault_mode@twice-basic-imm.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167334v6/bat-lnl-2/igt@xe_exec_fault_mode@twice-basic-imm.html
    - bat-lnl-1:          [PASS][53] -> [FAIL][54] ([Intel XE#8948])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/bat-lnl-1/igt@xe_exec_fault_mode@twice-basic-imm.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167334v6/bat-lnl-1/igt@xe_exec_fault_mode@twice-basic-imm.html

  * igt@xe_live_ktest@xe_dma_buf:
    - bat-bmg-2:          [PASS][55] -> [ABORT][56] ([Intel XE#8007]) +1 other test abort
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167334v6/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html

  
#### Possible fixes ####

  * igt@xe_waitfence@reltime:
    - bat-ptl-2:          [FAIL][57] -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/bat-ptl-2/igt@xe_waitfence@reltime.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167334v6/bat-ptl-2/igt@xe_waitfence@reltime.html

  
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8948


Build changes
-------------

  * IGT: IGT_9080 -> IGT_9081
  * Linux: xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3 -> xe-pw-167334v6

  IGT_9080: 65c1a091179475c3f0cd925799b49f58720bcf43 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9081: 9081
  xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3: bb742c97086d95b2a04b1b8fbc67822b4cf848c3
  xe-pw-167334v6: 167334v6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167334v6/index.html

--===============9023034711716436146==
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
<tr><td><b>Series:</b></td><td>drm/xe/pagefault: Add SRCID to pagefault reporting (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/167334/">https://patchwork.freedesktop.org/series/167334/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167334v6/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167334v6/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3_BAT -&gt; xe-pw-167334v6_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-167334v6_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-167334v6_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (13 -&gt; 11)</h2>
<p>Missing    (2): bat-bmg-1 bat-nvls-1 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-167334v6_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue:</p>
<ul>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/bat-wcl-2/igt@xe_exec_fault_mode@twice-bindexecqueue.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167334v6/bat-wcl-2/igt@xe_exec_fault_mode@twice-bindexecqueue.html">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr:</p>
<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/bat-ptl-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167334v6/bat-ptl-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html">FAIL</a> +43 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/bat-wcl-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167334v6/bat-wcl-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html">FAIL</a> +42 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/bat-lnl-1/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167334v6/bat-lnl-1/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch.html">FAIL</a> +42 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate:</p>
<ul>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/bat-wcl-1/igt@xe_exec_fault_mode@twice-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167334v6/bat-wcl-1/igt@xe_exec_fault_mode@twice-userptr-invalidate.html">DMESG-FAIL</a></li>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/bat-ptl-1/igt@xe_exec_fault_mode@twice-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167334v6/bat-ptl-1/igt@xe_exec_fault_mode@twice-userptr-invalidate.html">DMESG-FAIL</a> +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/bat-lnl-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167334v6/bat-lnl-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">FAIL</a> +42 other tests fail</li>
<li>bat-nvls-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/bat-nvls-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167334v6/bat-nvls-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">FAIL</a> +43 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-lr:</p>
<ul>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/bat-wcl-1/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167334v6/bat-wcl-1/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html">FAIL</a> +42 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:</p>
<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/bat-ptl-2/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167334v6/bat-ptl-2/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html">TIMEOUT</a></li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/bat-bmg-2/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167334v6/bat-bmg-2/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html">TIMEOUT</a></li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/bat-lnl-2/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167334v6/bat-lnl-2/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html">TIMEOUT</a></li>
<li>bat-nvls-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/bat-nvls-2/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167334v6/bat-nvls-2/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html">TIMEOUT</a></li>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/bat-wcl-1/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167334v6/bat-wcl-1/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html">TIMEOUT</a></li>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/bat-ptl-1/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167334v6/bat-ptl-1/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html">TIMEOUT</a></li>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/bat-wcl-2/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167334v6/bat-wcl-2/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html">TIMEOUT</a></li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/bat-lnl-1/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167334v6/bat-lnl-1/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html">TIMEOUT</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@madvise-atomic-inc:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/bat-bmg-2/igt@xe_exec_system_allocator@madvise-atomic-inc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167334v6/bat-bmg-2/igt@xe_exec_system_allocator@madvise-atomic-inc.html">FAIL</a> +12 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-malloc:</p>
<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/bat-ptl-1/igt@xe_exec_system_allocator@once-malloc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167334v6/bat-ptl-1/igt@xe_exec_system_allocator@once-malloc.html">FAIL</a> +41 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-latency-prefetch:</p>
<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/bat-bmg-3/igt@xe_multigpu_svm@mgpu-latency-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167334v6/bat-bmg-3/igt@xe_multigpu_svm@mgpu-latency-prefetch.html">FAIL</a> +19 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-migration-basic:</p>
<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/bat-bmg-3/igt@xe_multigpu_svm@mgpu-migration-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167334v6/bat-bmg-3/igt@xe_multigpu_svm@mgpu-migration-basic.html">DMESG-FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-167334v6_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/bat-ptl-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167334v6/bat-ptl-2/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/bat-lnl-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167334v6/bat-lnl-2/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/bat-ptl-1/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167334v6/bat-ptl-1/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167334v6/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-basic-imm:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/bat-lnl-2/igt@xe_exec_fault_mode@twice-basic-imm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167334v6/bat-lnl-2/igt@xe_exec_fault_mode@twice-basic-imm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8948">Intel XE#8948</a>)</li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/bat-lnl-1/igt@xe_exec_fault_mode@twice-basic-imm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167334v6/bat-lnl-1/igt@xe_exec_fault_mode@twice-basic-imm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8948">Intel XE#8948</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167334v6/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) +1 other test abort</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_waitfence@reltime:<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3/bat-ptl-2/igt@xe_waitfence@reltime.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167334v6/bat-ptl-2/igt@xe_waitfence@reltime.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9080 -&gt; IGT_9081</li>
<li>Linux: xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3 -&gt; xe-pw-167334v6</li>
</ul>
<p>IGT_9080: 65c1a091179475c3f0cd925799b49f58720bcf43 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9081: 9081<br />
  xe-5680-bb742c97086d95b2a04b1b8fbc67822b4cf848c3: bb742c97086d95b2a04b1b8fbc67822b4cf848c3<br />
  xe-pw-167334v6: 167334v6</p>

</body>
</html>

--===============9023034711716436146==--
