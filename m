Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58C93D10388
	for <intel-xe@archiver.kernel.org>; Thu, 24 Oct 2024 22:13:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F0FB10E3E0;
	Thu, 24 Oct 2024 22:13:44 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAB9710E3E0;
 Thu, 24 Oct 2024 22:13:42 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4069216290755664568=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_drm/xe/mmap=3A_Add_mmap_support_?=
 =?utf-8?q?for_PCI_memory_barrier_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 24 Oct 2024 22:13:42 -0000
Message-ID: <172980802282.1327227.3727706438529685725@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241024053158.984238-1-tejas.upadhyay@intel.com>
In-Reply-To: <20241024053158.984238-1-tejas.upadhyay@intel.com>
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

--===============4069216290755664568==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/mmap: Add mmap support for PCI memory barrier (rev5)
URL   : https://patchwork.freedesktop.org/series/139769/
State : failure

== Summary ==

CI Bug Log - changes from xe-2120-121cd95da591284c97d6f9ac1c58c7a79d27b201_BAT -> xe-pw-139769v5_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-139769v5_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-139769v5_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-139769v5_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_fault_mode@twice-invalid-userptr-fault:
    - bat-pvc-2:          [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2120-121cd95da591284c97d6f9ac1c58c7a79d27b201/bat-pvc-2/igt@xe_exec_fault_mode@twice-invalid-userptr-fault.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v5/bat-pvc-2/igt@xe_exec_fault_mode@twice-invalid-userptr-fault.html
    - bat-lnl-2:          [PASS][3] -> [DMESG-WARN][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2120-121cd95da591284c97d6f9ac1c58c7a79d27b201/bat-lnl-2/igt@xe_exec_fault_mode@twice-invalid-userptr-fault.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v5/bat-lnl-2/igt@xe_exec_fault_mode@twice-invalid-userptr-fault.html

  * igt@xe_exec_reset@cm-close-fd-no-exec:
    - bat-adlp-vf:        [PASS][5] -> [DMESG-WARN][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2120-121cd95da591284c97d6f9ac1c58c7a79d27b201/bat-adlp-vf/igt@xe_exec_reset@cm-close-fd-no-exec.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v5/bat-adlp-vf/igt@xe_exec_reset@cm-close-fd-no-exec.html
    - bat-bmg-2:          [PASS][7] -> [DMESG-WARN][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2120-121cd95da591284c97d6f9ac1c58c7a79d27b201/bat-bmg-2/igt@xe_exec_reset@cm-close-fd-no-exec.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v5/bat-bmg-2/igt@xe_exec_reset@cm-close-fd-no-exec.html
    - bat-bmg-1:          [PASS][9] -> [DMESG-WARN][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2120-121cd95da591284c97d6f9ac1c58c7a79d27b201/bat-bmg-1/igt@xe_exec_reset@cm-close-fd-no-exec.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v5/bat-bmg-1/igt@xe_exec_reset@cm-close-fd-no-exec.html

  * igt@xe_exec_threads@threads-mixed-shared-vm-basic:
    - bat-dg2-oem2:       [PASS][11] -> [DMESG-WARN][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2120-121cd95da591284c97d6f9ac1c58c7a79d27b201/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v5/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html
    - bat-atsm-2:         [PASS][13] -> [DMESG-WARN][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2120-121cd95da591284c97d6f9ac1c58c7a79d27b201/bat-atsm-2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v5/bat-atsm-2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html

  * igt@xe_live_ktest@xe_dma_buf:
    - bat-bmg-2:          [PASS][15] -> [SKIP][16] +2 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2120-121cd95da591284c97d6f9ac1c58c7a79d27b201/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v5/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html

  * igt@xe_live_ktest@xe_migrate:
    - bat-bmg-1:          [PASS][17] -> [SKIP][18] +2 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2120-121cd95da591284c97d6f9ac1c58c7a79d27b201/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v5/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html

  
Known issues
------------

  Here are the changes found in xe-pw-139769v5_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_live_ktest@xe_bo:
    - bat-adlp-vf:        [PASS][19] -> [SKIP][20] ([Intel XE#1192]) +2 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2120-121cd95da591284c97d6f9ac1c58c7a79d27b201/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v5/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - bat-lnl-2:          NOTRUN -> [SKIP][21] ([Intel XE#2229]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v5/bat-lnl-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
    - bat-adlp-7:         [PASS][22] -> [INCOMPLETE][23] ([Intel XE#2874]) +1 other test incomplete
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2120-121cd95da591284c97d6f9ac1c58c7a79d27b201/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v5/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][24] ([Intel XE#2229])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v5/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  
#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-lnl-1:          [FAIL][25] ([Intel XE#886]) -> [PASS][26] +1 other test pass
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2120-121cd95da591284c97d6f9ac1c58c7a79d27b201/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v5/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [FAIL][27] ([Intel XE#1861]) -> [PASS][28]
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2120-121cd95da591284c97d6f9ac1c58c7a79d27b201/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v5/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  * igt@xe_exec_fault_mode@twice-invalid-fault:
    - bat-lnl-1:          [DMESG-WARN][29] -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2120-121cd95da591284c97d6f9ac1c58c7a79d27b201/bat-lnl-1/igt@xe_exec_fault_mode@twice-invalid-fault.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v5/bat-lnl-1/igt@xe_exec_fault_mode@twice-invalid-fault.html

  * igt@xe_exec_fault_mode@twice-invalid-userptr-fault:
    - bat-bmg-2:          [DMESG-WARN][31] -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2120-121cd95da591284c97d6f9ac1c58c7a79d27b201/bat-bmg-2/igt@xe_exec_fault_mode@twice-invalid-userptr-fault.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v5/bat-bmg-2/igt@xe_exec_fault_mode@twice-invalid-userptr-fault.html

  * igt@xe_exec_reset@cm-close-fd-no-exec:
    - bat-dg2-oem2:       [DMESG-WARN][33] -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2120-121cd95da591284c97d6f9ac1c58c7a79d27b201/bat-dg2-oem2/igt@xe_exec_reset@cm-close-fd-no-exec.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v5/bat-dg2-oem2/igt@xe_exec_reset@cm-close-fd-no-exec.html

  * igt@xe_exec_store@basic-store:
    - bat-lnl-2:          [DMESG-WARN][35] -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2120-121cd95da591284c97d6f9ac1c58c7a79d27b201/bat-lnl-2/igt@xe_exec_store@basic-store.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v5/bat-lnl-2/igt@xe_exec_store@basic-store.html

  * igt@xe_exec_threads@threads-mixed-basic:
    - bat-atsm-2:         [DMESG-WARN][37] -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2120-121cd95da591284c97d6f9ac1c58c7a79d27b201/bat-atsm-2/igt@xe_exec_threads@threads-mixed-basic.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v5/bat-atsm-2/igt@xe_exec_threads@threads-mixed-basic.html
    - bat-pvc-2:          [DMESG-WARN][39] -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2120-121cd95da591284c97d6f9ac1c58c7a79d27b201/bat-pvc-2/igt@xe_exec_threads@threads-mixed-basic.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v5/bat-pvc-2/igt@xe_exec_threads@threads-mixed-basic.html

  * igt@xe_live_ktest@xe_migrate:
    - bat-lnl-2:          [SKIP][41] ([Intel XE#1192]) -> [PASS][42] +2 other tests pass
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2120-121cd95da591284c97d6f9ac1c58c7a79d27b201/bat-lnl-2/igt@xe_live_ktest@xe_migrate.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v5/bat-lnl-2/igt@xe_live_ktest@xe_migrate.html
    - bat-dg2-oem2:       [SKIP][43] ([Intel XE#1192]) -> [PASS][44] +2 other tests pass
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2120-121cd95da591284c97d6f9ac1c58c7a79d27b201/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v5/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html

  
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886


Build changes
-------------

  * Linux: xe-2120-121cd95da591284c97d6f9ac1c58c7a79d27b201 -> xe-pw-139769v5

  IGT_8082: c8379ec8b26f3c21bae5473706b23da78bd26ffa @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2120-121cd95da591284c97d6f9ac1c58c7a79d27b201: 121cd95da591284c97d6f9ac1c58c7a79d27b201
  xe-pw-139769v5: 139769v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v5/index.html

--===============4069216290755664568==
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
<tr><td><b>Series:</b></td><td>drm/xe/mmap: Add mmap support for PCI memory barrier (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/139769/">https://patchwork.freedesktop.org/series/139769/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v5/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2120-121cd95da591284c97d6f9ac1c58c7a79d27b201_BAT -&gt; xe-pw-139769v5_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-139769v5_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-139769v5_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-139769v5_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_exec_fault_mode@twice-invalid-userptr-fault:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2120-121cd95da591284c97d6f9ac1c58c7a79d27b201/bat-pvc-2/igt@xe_exec_fault_mode@twice-invalid-userptr-fault.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v5/bat-pvc-2/igt@xe_exec_fault_mode@twice-invalid-userptr-fault.html">DMESG-WARN</a></li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2120-121cd95da591284c97d6f9ac1c58c7a79d27b201/bat-lnl-2/igt@xe_exec_fault_mode@twice-invalid-userptr-fault.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v5/bat-lnl-2/igt@xe_exec_fault_mode@twice-invalid-userptr-fault.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-close-fd-no-exec:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2120-121cd95da591284c97d6f9ac1c58c7a79d27b201/bat-adlp-vf/igt@xe_exec_reset@cm-close-fd-no-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v5/bat-adlp-vf/igt@xe_exec_reset@cm-close-fd-no-exec.html">DMESG-WARN</a></li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2120-121cd95da591284c97d6f9ac1c58c7a79d27b201/bat-bmg-2/igt@xe_exec_reset@cm-close-fd-no-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v5/bat-bmg-2/igt@xe_exec_reset@cm-close-fd-no-exec.html">DMESG-WARN</a></li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2120-121cd95da591284c97d6f9ac1c58c7a79d27b201/bat-bmg-1/igt@xe_exec_reset@cm-close-fd-no-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v5/bat-bmg-1/igt@xe_exec_reset@cm-close-fd-no-exec.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-shared-vm-basic:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2120-121cd95da591284c97d6f9ac1c58c7a79d27b201/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v5/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html">DMESG-WARN</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2120-121cd95da591284c97d6f9ac1c58c7a79d27b201/bat-atsm-2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v5/bat-atsm-2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2120-121cd95da591284c97d6f9ac1c58c7a79d27b201/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v5/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2120-121cd95da591284c97d6f9ac1c58c7a79d27b201/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v5/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-139769v5_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2120-121cd95da591284c97d6f9ac1c58c7a79d27b201/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v5/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:</p>
<ul>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v5/bat-lnl-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2120-121cd95da591284c97d6f9ac1c58c7a79d27b201/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v5/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874">Intel XE#2874</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v5/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2120-121cd95da591284c97d6f9ac1c58c7a79d27b201/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v5/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2120-121cd95da591284c97d6f9ac1c58c7a79d27b201/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v5/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-invalid-fault:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2120-121cd95da591284c97d6f9ac1c58c7a79d27b201/bat-lnl-1/igt@xe_exec_fault_mode@twice-invalid-fault.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v5/bat-lnl-1/igt@xe_exec_fault_mode@twice-invalid-fault.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-invalid-userptr-fault:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2120-121cd95da591284c97d6f9ac1c58c7a79d27b201/bat-bmg-2/igt@xe_exec_fault_mode@twice-invalid-userptr-fault.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v5/bat-bmg-2/igt@xe_exec_fault_mode@twice-invalid-userptr-fault.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-close-fd-no-exec:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2120-121cd95da591284c97d6f9ac1c58c7a79d27b201/bat-dg2-oem2/igt@xe_exec_reset@cm-close-fd-no-exec.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v5/bat-dg2-oem2/igt@xe_exec_reset@cm-close-fd-no-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_store@basic-store:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2120-121cd95da591284c97d6f9ac1c58c7a79d27b201/bat-lnl-2/igt@xe_exec_store@basic-store.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v5/bat-lnl-2/igt@xe_exec_store@basic-store.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-basic:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2120-121cd95da591284c97d6f9ac1c58c7a79d27b201/bat-atsm-2/igt@xe_exec_threads@threads-mixed-basic.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v5/bat-atsm-2/igt@xe_exec_threads@threads-mixed-basic.html">PASS</a></li>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2120-121cd95da591284c97d6f9ac1c58c7a79d27b201/bat-pvc-2/igt@xe_exec_threads@threads-mixed-basic.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v5/bat-pvc-2/igt@xe_exec_threads@threads-mixed-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2120-121cd95da591284c97d6f9ac1c58c7a79d27b201/bat-lnl-2/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v5/bat-lnl-2/igt@xe_live_ktest@xe_migrate.html">PASS</a> +2 other tests pass</li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2120-121cd95da591284c97d6f9ac1c58c7a79d27b201/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v5/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2120-121cd95da591284c97d6f9ac1c58c7a79d27b201 -&gt; xe-pw-139769v5</li>
</ul>
<p>IGT_8082: c8379ec8b26f3c21bae5473706b23da78bd26ffa @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2120-121cd95da591284c97d6f9ac1c58c7a79d27b201: 121cd95da591284c97d6f9ac1c58c7a79d27b201<br />
  xe-pw-139769v5: 139769v5</p>

</body>
</html>

--===============4069216290755664568==--
