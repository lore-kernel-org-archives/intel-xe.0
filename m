Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D8A4CAC5B8
	for <intel-xe@archiver.kernel.org>; Thu,  2 Oct 2025 23:58:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6105810E85E;
	Thu,  2 Oct 2025 23:58:02 +0000 (UTC)
Received: from 6aec98b87f92 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E4A710E1D1;
 Thu,  2 Oct 2025 23:58:01 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4823957269751893686=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_Fix_a_couple_of_wedge_corne?=
 =?utf-8?q?r-case_memory_leaks?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Stuart Summers" <stuart.summers@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 02 Oct 2025 23:58:01 -0000
Message-ID: <175944948144.1380.15515839349303608198@6aec98b87f92>
X-Patchwork-Hint: ignore
References: <20251002230444.313505-1-stuart.summers@intel.com>
In-Reply-To: <20251002230444.313505-1-stuart.summers@intel.com>
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

--===============4823957269751893686==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fix a couple of wedge corner-case memory leaks
URL   : https://patchwork.freedesktop.org/series/155352/
State : failure

== Summary ==

CI Bug Log - changes from xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434_BAT -> xe-pw-155352v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-155352v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-155352v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-155352v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_dma_buf_sync@export-dma-buf-once-write-sync:
    - bat-adlp-7:         [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/bat-adlp-7/igt@xe_dma_buf_sync@export-dma-buf-once-write-sync.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/bat-adlp-7/igt@xe_dma_buf_sync@export-dma-buf-once-write-sync.html
    - bat-lnl-2:          [PASS][3] -> [DMESG-WARN][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/bat-lnl-2/igt@xe_dma_buf_sync@export-dma-buf-once-write-sync.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/bat-lnl-2/igt@xe_dma_buf_sync@export-dma-buf-once-write-sync.html
    - bat-adlp-vm:        [PASS][5] -> [DMESG-WARN][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/bat-adlp-vm/igt@xe_dma_buf_sync@export-dma-buf-once-write-sync.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/bat-adlp-vm/igt@xe_dma_buf_sync@export-dma-buf-once-write-sync.html
    - bat-dg2-oem2:       [PASS][7] -> [ABORT][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/bat-dg2-oem2/igt@xe_dma_buf_sync@export-dma-buf-once-write-sync.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/bat-dg2-oem2/igt@xe_dma_buf_sync@export-dma-buf-once-write-sync.html
    - bat-lnl-1:          [PASS][9] -> [DMESG-WARN][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/bat-lnl-1/igt@xe_dma_buf_sync@export-dma-buf-once-write-sync.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/bat-lnl-1/igt@xe_dma_buf_sync@export-dma-buf-once-write-sync.html

  * igt@xe_exec_balancer@twice-cm-virtual-userptr:
    - bat-bmg-2:          [PASS][11] -> [DMESG-WARN][12] +3 other tests dmesg-warn
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/bat-bmg-2/igt@xe_exec_balancer@twice-cm-virtual-userptr.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/bat-bmg-2/igt@xe_exec_balancer@twice-cm-virtual-userptr.html
    - bat-atsm-2:         [PASS][13] -> [DMESG-WARN][14] +3 other tests dmesg-warn
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/bat-atsm-2/igt@xe_exec_balancer@twice-cm-virtual-userptr.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/bat-atsm-2/igt@xe_exec_balancer@twice-cm-virtual-userptr.html

  * igt@xe_exec_balancer@twice-virtual-userptr:
    - bat-adlp-vm:        [PASS][15] -> [ABORT][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/bat-adlp-vm/igt@xe_exec_balancer@twice-virtual-userptr.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/bat-adlp-vm/igt@xe_exec_balancer@twice-virtual-userptr.html

  * igt@xe_exec_balancer@twice-virtual-userptr-invalidate:
    - bat-bmg-1:          [PASS][17] -> [DMESG-WARN][18] +4 other tests dmesg-warn
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/bat-bmg-1/igt@xe_exec_balancer@twice-virtual-userptr-invalidate.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/bat-bmg-1/igt@xe_exec_balancer@twice-virtual-userptr-invalidate.html

  * igt@xe_exec_compute_mode@twice-preempt-fence-early:
    - bat-adlp-7:         [PASS][19] -> [DMESG-FAIL][20] +10 other tests dmesg-fail
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/bat-adlp-7/igt@xe_exec_compute_mode@twice-preempt-fence-early.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/bat-adlp-7/igt@xe_exec_compute_mode@twice-preempt-fence-early.html

  * igt@xe_exec_compute_mode@twice-userptr-invalidate:
    - bat-atsm-2:         [PASS][21] -> [DMESG-FAIL][22] +17 other tests dmesg-fail
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-basic:
    - bat-bmg-2:          [PASS][23] -> [TIMEOUT][24]
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/bat-bmg-2/igt@xe_exec_fault_mode@many-basic.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/bat-bmg-2/igt@xe_exec_fault_mode@many-basic.html
    - bat-bmg-1:          [PASS][25] -> [TIMEOUT][26]
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/bat-bmg-1/igt@xe_exec_fault_mode@many-basic.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/bat-bmg-1/igt@xe_exec_fault_mode@many-basic.html
    - bat-lnl-2:          [PASS][27] -> [TIMEOUT][28]
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/bat-lnl-2/igt@xe_exec_fault_mode@many-basic.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/bat-lnl-2/igt@xe_exec_fault_mode@many-basic.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch:
    - bat-lnl-1:          [PASS][29] -> [DMESG-FAIL][30] +46 other tests dmesg-fail
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/bat-lnl-1/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/bat-lnl-1/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch.html

  * igt@xe_exec_fault_mode@twice-rebind-prefetch:
    - bat-bmg-1:          [PASS][31] -> [DMESG-FAIL][32] +47 other tests dmesg-fail
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/bat-bmg-1/igt@xe_exec_fault_mode@twice-rebind-prefetch.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/bat-bmg-1/igt@xe_exec_fault_mode@twice-rebind-prefetch.html

  * igt@xe_exec_fault_mode@twice-userptr-imm:
    - bat-bmg-2:          [PASS][33] -> [DMESG-FAIL][34] +47 other tests dmesg-fail
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/bat-bmg-2/igt@xe_exec_fault_mode@twice-userptr-imm.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/bat-bmg-2/igt@xe_exec_fault_mode@twice-userptr-imm.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:
    - bat-lnl-2:          [PASS][35] -> [DMESG-FAIL][36] +45 other tests dmesg-fail
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/bat-lnl-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/bat-lnl-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html

  * igt@xe_exec_store@basic-store:
    - bat-adlp-7:         [PASS][37] -> [ABORT][38]
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/bat-adlp-7/igt@xe_exec_store@basic-store.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/bat-adlp-7/igt@xe_exec_store@basic-store.html

  * igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race:
    - bat-atsm-2:         [PASS][39] -> [ABORT][40]
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/bat-atsm-2/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/bat-atsm-2/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html
    - bat-bmg-2:          [PASS][41] -> [ABORT][42]
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/bat-bmg-2/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/bat-bmg-2/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-mixed-userptr-invalidate:
    - bat-bmg-1:          [PASS][43] -> [ABORT][44]
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/bat-bmg-1/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/bat-bmg-1/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@xe_dma_buf_sync@export-dma-buf-once-read-write-sync:
    - {bat-ptl-vm}:       [PASS][45] -> [DMESG-WARN][46] +1 other test dmesg-warn
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/bat-ptl-vm/igt@xe_dma_buf_sync@export-dma-buf-once-read-write-sync.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/bat-ptl-vm/igt@xe_dma_buf_sync@export-dma-buf-once-read-write-sync.html

  * igt@xe_dma_buf_sync@export-dma-buf-once-write-sync:
    - {bat-ptl-2}:        [PASS][47] -> [DMESG-WARN][48]
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/bat-ptl-2/igt@xe_dma_buf_sync@export-dma-buf-once-write-sync.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/bat-ptl-2/igt@xe_dma_buf_sync@export-dma-buf-once-write-sync.html
    - {bat-ptl-1}:        [PASS][49] -> [DMESG-WARN][50]
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/bat-ptl-1/igt@xe_dma_buf_sync@export-dma-buf-once-write-sync.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/bat-ptl-1/igt@xe_dma_buf_sync@export-dma-buf-once-write-sync.html

  * igt@xe_exec_compute_mode@twice-bindexecqueue:
    - {bat-ptl-1}:        [PASS][51] -> [DMESG-FAIL][52] +46 other tests dmesg-fail
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/bat-ptl-1/igt@xe_exec_compute_mode@twice-bindexecqueue.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/bat-ptl-1/igt@xe_exec_compute_mode@twice-bindexecqueue.html

  * igt@xe_exec_fault_mode@twice-basic:
    - {bat-ptl-vm}:       [PASS][53] -> [DMESG-FAIL][54] +46 other tests dmesg-fail
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/bat-ptl-vm/igt@xe_exec_fault_mode@twice-basic.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/bat-ptl-vm/igt@xe_exec_fault_mode@twice-basic.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr:
    - {bat-ptl-2}:        [PASS][55] -> [DMESG-FAIL][56] +46 other tests dmesg-fail
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/bat-ptl-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/bat-ptl-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html

  
Known issues
------------

  Here are the changes found in xe-pw-155352v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_threads@threads-basic:
    - bat-bmg-2:          [PASS][57] -> [DMESG-FAIL][58] ([Intel XE#3876]) +2 other tests dmesg-fail
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/bat-bmg-2/igt@xe_exec_threads@threads-basic.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/bat-bmg-2/igt@xe_exec_threads@threads-basic.html

  * igt@xe_exec_threads@threads-mixed-fd-basic:
    - bat-bmg-1:          [PASS][59] -> [DMESG-FAIL][60] ([Intel XE#3876])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/bat-bmg-1/igt@xe_exec_threads@threads-mixed-fd-basic.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/bat-bmg-1/igt@xe_exec_threads@threads-mixed-fd-basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876


Build changes
-------------

  * Linux: xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434 -> xe-pw-155352v1

  IGT_8572: 8572
  xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434: 0aa5ad66ed77cd8c3bb9fb01997f68f31200f434
  xe-pw-155352v1: 155352v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/index.html

--===============4823957269751893686==
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
<tr><td><b>Series:</b></td><td>Fix a couple of wedge corner-case memory leaks</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/155352/">https://patchwork.freedesktop.org/series/155352/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434_BAT -&gt; xe-pw-155352v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-155352v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-155352v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-155352v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_dma_buf_sync@export-dma-buf-once-write-sync:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/bat-adlp-7/igt@xe_dma_buf_sync@export-dma-buf-once-write-sync.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/bat-adlp-7/igt@xe_dma_buf_sync@export-dma-buf-once-write-sync.html">DMESG-WARN</a></li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/bat-lnl-2/igt@xe_dma_buf_sync@export-dma-buf-once-write-sync.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/bat-lnl-2/igt@xe_dma_buf_sync@export-dma-buf-once-write-sync.html">DMESG-WARN</a></li>
<li>bat-adlp-vm:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/bat-adlp-vm/igt@xe_dma_buf_sync@export-dma-buf-once-write-sync.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/bat-adlp-vm/igt@xe_dma_buf_sync@export-dma-buf-once-write-sync.html">DMESG-WARN</a></li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/bat-dg2-oem2/igt@xe_dma_buf_sync@export-dma-buf-once-write-sync.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/bat-dg2-oem2/igt@xe_dma_buf_sync@export-dma-buf-once-write-sync.html">ABORT</a></li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/bat-lnl-1/igt@xe_dma_buf_sync@export-dma-buf-once-write-sync.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/bat-lnl-1/igt@xe_dma_buf_sync@export-dma-buf-once-write-sync.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-cm-virtual-userptr:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/bat-bmg-2/igt@xe_exec_balancer@twice-cm-virtual-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/bat-bmg-2/igt@xe_exec_balancer@twice-cm-virtual-userptr.html">DMESG-WARN</a> +3 other tests dmesg-warn</li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/bat-atsm-2/igt@xe_exec_balancer@twice-cm-virtual-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/bat-atsm-2/igt@xe_exec_balancer@twice-cm-virtual-userptr.html">DMESG-WARN</a> +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-virtual-userptr:</p>
<ul>
<li>bat-adlp-vm:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/bat-adlp-vm/igt@xe_exec_balancer@twice-virtual-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/bat-adlp-vm/igt@xe_exec_balancer@twice-virtual-userptr.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-virtual-userptr-invalidate:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/bat-bmg-1/igt@xe_exec_balancer@twice-virtual-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/bat-bmg-1/igt@xe_exec_balancer@twice-virtual-userptr-invalidate.html">DMESG-WARN</a> +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-preempt-fence-early:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/bat-adlp-7/igt@xe_exec_compute_mode@twice-preempt-fence-early.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/bat-adlp-7/igt@xe_exec_compute_mode@twice-preempt-fence-early.html">DMESG-FAIL</a> +10 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-userptr-invalidate:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html">DMESG-FAIL</a> +17 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-basic:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/bat-bmg-2/igt@xe_exec_fault_mode@many-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/bat-bmg-2/igt@xe_exec_fault_mode@many-basic.html">TIMEOUT</a></li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/bat-bmg-1/igt@xe_exec_fault_mode@many-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/bat-bmg-1/igt@xe_exec_fault_mode@many-basic.html">TIMEOUT</a></li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/bat-lnl-2/igt@xe_exec_fault_mode@many-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/bat-lnl-2/igt@xe_exec_fault_mode@many-basic.html">TIMEOUT</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/bat-lnl-1/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/bat-lnl-1/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch.html">DMESG-FAIL</a> +46 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-rebind-prefetch:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/bat-bmg-1/igt@xe_exec_fault_mode@twice-rebind-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/bat-bmg-1/igt@xe_exec_fault_mode@twice-rebind-prefetch.html">DMESG-FAIL</a> +47 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-imm:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/bat-bmg-2/igt@xe_exec_fault_mode@twice-userptr-imm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/bat-bmg-2/igt@xe_exec_fault_mode@twice-userptr-imm.html">DMESG-FAIL</a> +47 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/bat-lnl-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/bat-lnl-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">DMESG-FAIL</a> +45 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_store@basic-store:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/bat-adlp-7/igt@xe_exec_store@basic-store.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/bat-adlp-7/igt@xe_exec_store@basic-store.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/bat-atsm-2/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/bat-atsm-2/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html">ABORT</a></li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/bat-bmg-2/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/bat-bmg-2/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-userptr-invalidate:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/bat-bmg-1/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/bat-bmg-1/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html">ABORT</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@xe_dma_buf_sync@export-dma-buf-once-read-write-sync:</p>
<ul>
<li>{bat-ptl-vm}:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/bat-ptl-vm/igt@xe_dma_buf_sync@export-dma-buf-once-read-write-sync.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/bat-ptl-vm/igt@xe_dma_buf_sync@export-dma-buf-once-read-write-sync.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_dma_buf_sync@export-dma-buf-once-write-sync:</p>
<ul>
<li>{bat-ptl-2}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/bat-ptl-2/igt@xe_dma_buf_sync@export-dma-buf-once-write-sync.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/bat-ptl-2/igt@xe_dma_buf_sync@export-dma-buf-once-write-sync.html">DMESG-WARN</a></li>
<li>{bat-ptl-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/bat-ptl-1/igt@xe_dma_buf_sync@export-dma-buf-once-write-sync.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/bat-ptl-1/igt@xe_dma_buf_sync@export-dma-buf-once-write-sync.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-bindexecqueue:</p>
<ul>
<li>{bat-ptl-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/bat-ptl-1/igt@xe_exec_compute_mode@twice-bindexecqueue.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/bat-ptl-1/igt@xe_exec_compute_mode@twice-bindexecqueue.html">DMESG-FAIL</a> +46 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-basic:</p>
<ul>
<li>{bat-ptl-vm}:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/bat-ptl-vm/igt@xe_exec_fault_mode@twice-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/bat-ptl-vm/igt@xe_exec_fault_mode@twice-basic.html">DMESG-FAIL</a> +46 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr:</p>
<ul>
<li>{bat-ptl-2}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/bat-ptl-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/bat-ptl-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html">DMESG-FAIL</a> +46 other tests dmesg-fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-155352v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_exec_threads@threads-basic:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/bat-bmg-2/igt@xe_exec_threads@threads-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/bat-bmg-2/igt@xe_exec_threads@threads-basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>) +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-fd-basic:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434/bat-bmg-1/igt@xe_exec_threads@threads-mixed-fd-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155352v1/bat-bmg-1/igt@xe_exec_threads@threads-mixed-fd-basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434 -&gt; xe-pw-155352v1</li>
</ul>
<p>IGT_8572: 8572<br />
  xe-3859-0aa5ad66ed77cd8c3bb9fb01997f68f31200f434: 0aa5ad66ed77cd8c3bb9fb01997f68f31200f434<br />
  xe-pw-155352v1: 155352v1</p>

</body>
</html>

--===============4823957269751893686==--
