Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281ED606A31D
	for <intel-xe@archiver.kernel.org>; Tue, 27 Oct 2026 21:12:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E183210E4A2;
	Tue, 27 Oct 2026 21:12:39 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F93710E4A2;
 Tue, 27 Oct 2026 21:12:38 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4840911437369763778=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_Add_a_minimum_age_gate_to_t?=
 =?utf-8?q?he_shrinker_+_LRU_fixes_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 27 Oct 2026 21:12:38 -0000
Message-ID: <179313555818.78878.204257186265767201@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261027203107.1065800-1-matthew.brost@intel.com>
In-Reply-To: <20261027203107.1065800-1-matthew.brost@intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-xe@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-1.0 required=3.0 tests=BAYES_00,HTML_MESSAGE,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============4840911437369763778==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add a minimum age gate to the shrinker + LRU fixes (rev2)
URL   : https://patchwork.freedesktop.org/series/176975/
State : failure

== Summary ==

CI Bug Log - changes from xe-6016-5e5b89446954adf0d9b74ba4228862403f71eec4_BAT -> xe-pw-176975v2_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-176975v2_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-176975v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (15 -> 15)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-176975v2_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_fault_mode@invalid-va:
    - bat-bmg-2:          [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6016-5e5b89446954adf0d9b74ba4228862403f71eec4/bat-bmg-2/igt@xe_exec_fault_mode@invalid-va.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176975v2/bat-bmg-2/igt@xe_exec_fault_mode@invalid-va.html
    - bat-bmg-1:          [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6016-5e5b89446954adf0d9b74ba4228862403f71eec4/bat-bmg-1/igt@xe_exec_fault_mode@invalid-va.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176975v2/bat-bmg-1/igt@xe_exec_fault_mode@invalid-va.html
    - bat-nvls-1:         [PASS][5] -> [ABORT][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6016-5e5b89446954adf0d9b74ba4228862403f71eec4/bat-nvls-1/igt@xe_exec_fault_mode@invalid-va.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176975v2/bat-nvls-1/igt@xe_exec_fault_mode@invalid-va.html
    - bat-lnl-2:          [PASS][7] -> [ABORT][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6016-5e5b89446954adf0d9b74ba4228862403f71eec4/bat-lnl-2/igt@xe_exec_fault_mode@invalid-va.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176975v2/bat-lnl-2/igt@xe_exec_fault_mode@invalid-va.html
    - bat-nvls-2:         [PASS][9] -> [ABORT][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6016-5e5b89446954adf0d9b74ba4228862403f71eec4/bat-nvls-2/igt@xe_exec_fault_mode@invalid-va.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176975v2/bat-nvls-2/igt@xe_exec_fault_mode@invalid-va.html
    - bat-wcl-1:          [PASS][11] -> [ABORT][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6016-5e5b89446954adf0d9b74ba4228862403f71eec4/bat-wcl-1/igt@xe_exec_fault_mode@invalid-va.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176975v2/bat-wcl-1/igt@xe_exec_fault_mode@invalid-va.html
    - bat-ptl-1:          [PASS][13] -> [ABORT][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6016-5e5b89446954adf0d9b74ba4228862403f71eec4/bat-ptl-1/igt@xe_exec_fault_mode@invalid-va.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176975v2/bat-ptl-1/igt@xe_exec_fault_mode@invalid-va.html
    - bat-ptl-vm:         [PASS][15] -> [ABORT][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6016-5e5b89446954adf0d9b74ba4228862403f71eec4/bat-ptl-vm/igt@xe_exec_fault_mode@invalid-va.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176975v2/bat-ptl-vm/igt@xe_exec_fault_mode@invalid-va.html
    - bat-wcl-2:          [PASS][17] -> [ABORT][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6016-5e5b89446954adf0d9b74ba4228862403f71eec4/bat-wcl-2/igt@xe_exec_fault_mode@invalid-va.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176975v2/bat-wcl-2/igt@xe_exec_fault_mode@invalid-va.html
    - bat-lnl-1:          [PASS][19] -> [ABORT][20]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6016-5e5b89446954adf0d9b74ba4228862403f71eec4/bat-lnl-1/igt@xe_exec_fault_mode@invalid-va.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176975v2/bat-lnl-1/igt@xe_exec_fault_mode@invalid-va.html
    - bat-bmg-vm:         [PASS][21] -> [ABORT][22]
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6016-5e5b89446954adf0d9b74ba4228862403f71eec4/bat-bmg-vm/igt@xe_exec_fault_mode@invalid-va.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176975v2/bat-bmg-vm/igt@xe_exec_fault_mode@invalid-va.html

  * igt@xe_multigpu_svm@mgpu-xgpu-access-basic:
    - bat-bmg-3:          [PASS][23] -> [ABORT][24]
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6016-5e5b89446954adf0d9b74ba4228862403f71eec4/bat-bmg-3/igt@xe_multigpu_svm@mgpu-xgpu-access-basic.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176975v2/bat-bmg-3/igt@xe_multigpu_svm@mgpu-xgpu-access-basic.html

  
Known issues
------------

  Here are the changes found in xe-pw-176975v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_create@create-execqueues-noleak:
    - bat-ptl-2:          NOTRUN -> [ABORT][25] ([Intel XE#9362])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176975v2/bat-ptl-2/igt@xe_create@create-execqueues-noleak.html

  
#### Possible fixes ####

  * igt@xe_compute_preempt@compute-threadgroup-preempt:
    - bat-ptl-2:          [ABORT][26] ([Intel XE#9362]) -> [PASS][27] +1 other test pass
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6016-5e5b89446954adf0d9b74ba4228862403f71eec4/bat-ptl-2/igt@xe_compute_preempt@compute-threadgroup-preempt.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176975v2/bat-ptl-2/igt@xe_compute_preempt@compute-threadgroup-preempt.html

  
  [Intel XE#9362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362


Build changes
-------------

  * Linux: xe-6016-5e5b89446954adf0d9b74ba4228862403f71eec4 -> xe-pw-176975v2

  IGT_9168: 9168
  xe-6016-5e5b89446954adf0d9b74ba4228862403f71eec4: 5e5b89446954adf0d9b74ba4228862403f71eec4
  xe-pw-176975v2: 176975v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176975v2/index.html

--===============4840911437369763778==
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
<tr><td><b>Series:</b></td><td>Add a minimum age gate to the shrinker + LRU fixes (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/176975/">https://patchwork.freedesktop.org/series/176975/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176975v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176975v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6016-5e5b89446954adf0d9b74ba4228862403f71eec4_BAT -&gt; xe-pw-176975v2_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-176975v2_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-176975v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-176975v2_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_exec_fault_mode@invalid-va:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6016-5e5b89446954adf0d9b74ba4228862403f71eec4/bat-bmg-2/igt@xe_exec_fault_mode@invalid-va.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176975v2/bat-bmg-2/igt@xe_exec_fault_mode@invalid-va.html">ABORT</a></li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6016-5e5b89446954adf0d9b74ba4228862403f71eec4/bat-bmg-1/igt@xe_exec_fault_mode@invalid-va.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176975v2/bat-bmg-1/igt@xe_exec_fault_mode@invalid-va.html">ABORT</a></li>
<li>bat-nvls-1:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6016-5e5b89446954adf0d9b74ba4228862403f71eec4/bat-nvls-1/igt@xe_exec_fault_mode@invalid-va.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176975v2/bat-nvls-1/igt@xe_exec_fault_mode@invalid-va.html">ABORT</a></li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6016-5e5b89446954adf0d9b74ba4228862403f71eec4/bat-lnl-2/igt@xe_exec_fault_mode@invalid-va.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176975v2/bat-lnl-2/igt@xe_exec_fault_mode@invalid-va.html">ABORT</a></li>
<li>bat-nvls-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6016-5e5b89446954adf0d9b74ba4228862403f71eec4/bat-nvls-2/igt@xe_exec_fault_mode@invalid-va.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176975v2/bat-nvls-2/igt@xe_exec_fault_mode@invalid-va.html">ABORT</a></li>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6016-5e5b89446954adf0d9b74ba4228862403f71eec4/bat-wcl-1/igt@xe_exec_fault_mode@invalid-va.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176975v2/bat-wcl-1/igt@xe_exec_fault_mode@invalid-va.html">ABORT</a></li>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6016-5e5b89446954adf0d9b74ba4228862403f71eec4/bat-ptl-1/igt@xe_exec_fault_mode@invalid-va.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176975v2/bat-ptl-1/igt@xe_exec_fault_mode@invalid-va.html">ABORT</a></li>
<li>bat-ptl-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6016-5e5b89446954adf0d9b74ba4228862403f71eec4/bat-ptl-vm/igt@xe_exec_fault_mode@invalid-va.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176975v2/bat-ptl-vm/igt@xe_exec_fault_mode@invalid-va.html">ABORT</a></li>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6016-5e5b89446954adf0d9b74ba4228862403f71eec4/bat-wcl-2/igt@xe_exec_fault_mode@invalid-va.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176975v2/bat-wcl-2/igt@xe_exec_fault_mode@invalid-va.html">ABORT</a></li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6016-5e5b89446954adf0d9b74ba4228862403f71eec4/bat-lnl-1/igt@xe_exec_fault_mode@invalid-va.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176975v2/bat-lnl-1/igt@xe_exec_fault_mode@invalid-va.html">ABORT</a></li>
<li>bat-bmg-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6016-5e5b89446954adf0d9b74ba4228862403f71eec4/bat-bmg-vm/igt@xe_exec_fault_mode@invalid-va.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176975v2/bat-bmg-vm/igt@xe_exec_fault_mode@invalid-va.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-xgpu-access-basic:</p>
<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6016-5e5b89446954adf0d9b74ba4228862403f71eec4/bat-bmg-3/igt@xe_multigpu_svm@mgpu-xgpu-access-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176975v2/bat-bmg-3/igt@xe_multigpu_svm@mgpu-xgpu-access-basic.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-176975v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_create@create-execqueues-noleak:<ul>
<li>bat-ptl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176975v2/bat-ptl-2/igt@xe_create@create-execqueues-noleak.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_compute_preempt@compute-threadgroup-preempt:<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6016-5e5b89446954adf0d9b74ba4228862403f71eec4/bat-ptl-2/igt@xe_compute_preempt@compute-threadgroup-preempt.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176975v2/bat-ptl-2/igt@xe_compute_preempt@compute-threadgroup-preempt.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-6016-5e5b89446954adf0d9b74ba4228862403f71eec4 -&gt; xe-pw-176975v2</li>
</ul>
<p>IGT_9168: 9168<br />
  xe-6016-5e5b89446954adf0d9b74ba4228862403f71eec4: 5e5b89446954adf0d9b74ba4228862403f71eec4<br />
  xe-pw-176975v2: 176975v2</p>

</body>
</html>

--===============4840911437369763778==--
