Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19144C982E1
	for <intel-xe@archiver.kernel.org>; Mon, 21 Sep 2026 11:47:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4C1D89ABE;
	Mon, 21 Sep 2026 11:47:29 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A53789ABE;
 Mon, 21 Sep 2026 11:47:28 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8205203725357544299=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_Refresh_TTM_LRU_on_SVM_pref?=
 =?utf-8?q?etch_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 21 Sep 2026 11:47:28 -0000
Message-ID: <178999124849.186928.5444038185741877262@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260921093651.2995928-6-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20260921093651.2995928-6-himal.prasad.ghimiray@intel.com>
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

--===============8205203725357544299==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Refresh TTM LRU on SVM prefetch (rev2)
URL   : https://patchwork.freedesktop.org/series/174276/
State : failure

== Summary ==

CI Bug Log - changes from xe-5792-dc206980a7161808eb0216a277afadc04244e091_BAT -> xe-pw-174276v2_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-174276v2_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-174276v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (14 -> 14)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-174276v2_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@runner@aborted:
    - bat-ptl-2:          NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174276v2/bat-ptl-2/igt@runner@aborted.html

  * igt@xe_exec_system_allocator@many-execqueues-malloc:
    - bat-bmg-vm:         [PASS][2] -> [DMESG-WARN][3] +1 other test dmesg-warn
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5792-dc206980a7161808eb0216a277afadc04244e091/bat-bmg-vm/igt@xe_exec_system_allocator@many-execqueues-malloc.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174276v2/bat-bmg-vm/igt@xe_exec_system_allocator@many-execqueues-malloc.html

  * igt@xe_exec_system_allocator@twice-free:
    - bat-bmg-1:          [PASS][4] -> [DMESG-WARN][5] +1 other test dmesg-warn
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5792-dc206980a7161808eb0216a277afadc04244e091/bat-bmg-1/igt@xe_exec_system_allocator@twice-free.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174276v2/bat-bmg-1/igt@xe_exec_system_allocator@twice-free.html

  * igt@xe_multigpu_svm@mgpu-atomic-op-prefetch:
    - bat-bmg-3:          [PASS][6] -> [ABORT][7]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5792-dc206980a7161808eb0216a277afadc04244e091/bat-bmg-3/igt@xe_multigpu_svm@mgpu-atomic-op-prefetch.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174276v2/bat-bmg-3/igt@xe_multigpu_svm@mgpu-atomic-op-prefetch.html

  
Known issues
------------

  Here are the changes found in xe-pw-174276v2_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_exec_system_allocator@many-execqueues-free:
    - bat-bmg-vm:         [DMESG-WARN][8] -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5792-dc206980a7161808eb0216a277afadc04244e091/bat-bmg-vm/igt@xe_exec_system_allocator@many-execqueues-free.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174276v2/bat-bmg-vm/igt@xe_exec_system_allocator@many-execqueues-free.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-malloc:
    - bat-bmg-1:          [DMESG-WARN][10] -> [PASS][11] +1 other test pass
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5792-dc206980a7161808eb0216a277afadc04244e091/bat-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174276v2/bat-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc.html

  


Build changes
-------------

  * Linux: xe-5792-dc206980a7161808eb0216a277afadc04244e091 -> xe-pw-174276v2

  IGT_9103: f307fd753abbe6c03d0a6e1c769fc6020ebd5d86 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5792-dc206980a7161808eb0216a277afadc04244e091: dc206980a7161808eb0216a277afadc04244e091
  xe-pw-174276v2: 174276v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174276v2/index.html

--===============8205203725357544299==
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
<tr><td><b>Series:</b></td><td>Refresh TTM LRU on SVM prefetch (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/174276/">https://patchwork.freedesktop.org/series/174276/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174276v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174276v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5792-dc206980a7161808eb0216a277afadc04244e091_BAT -&gt; xe-pw-174276v2_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-174276v2_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-174276v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (14 -&gt; 14)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-174276v2_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>bat-ptl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174276v2/bat-ptl-2/igt@runner@aborted.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-malloc:</p>
<ul>
<li>bat-bmg-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5792-dc206980a7161808eb0216a277afadc04244e091/bat-bmg-vm/igt@xe_exec_system_allocator@many-execqueues-malloc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174276v2/bat-bmg-vm/igt@xe_exec_system_allocator@many-execqueues-malloc.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-free:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5792-dc206980a7161808eb0216a277afadc04244e091/bat-bmg-1/igt@xe_exec_system_allocator@twice-free.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174276v2/bat-bmg-1/igt@xe_exec_system_allocator@twice-free.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-atomic-op-prefetch:</p>
<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5792-dc206980a7161808eb0216a277afadc04244e091/bat-bmg-3/igt@xe_multigpu_svm@mgpu-atomic-op-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174276v2/bat-bmg-3/igt@xe_multigpu_svm@mgpu-atomic-op-prefetch.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-174276v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-free:</p>
<ul>
<li>bat-bmg-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5792-dc206980a7161808eb0216a277afadc04244e091/bat-bmg-vm/igt@xe_exec_system_allocator@many-execqueues-free.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174276v2/bat-bmg-vm/igt@xe_exec_system_allocator@many-execqueues-free.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-malloc:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5792-dc206980a7161808eb0216a277afadc04244e091/bat-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174276v2/bat-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5792-dc206980a7161808eb0216a277afadc04244e091 -&gt; xe-pw-174276v2</li>
</ul>
<p>IGT_9103: f307fd753abbe6c03d0a6e1c769fc6020ebd5d86 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5792-dc206980a7161808eb0216a277afadc04244e091: dc206980a7161808eb0216a277afadc04244e091<br />
  xe-pw-174276v2: 174276v2</p>

</body>
</html>

--===============8205203725357544299==--
