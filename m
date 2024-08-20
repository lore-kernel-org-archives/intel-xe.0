Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B4B1C3DA4A
	for <intel-xe@archiver.kernel.org>; Tue, 20 Aug 2024 16:53:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E04D810E45A;
	Tue, 20 Aug 2024 16:53:04 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF13210E45A;
 Tue, 20 Aug 2024 16:53:03 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5662159229340874247=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_drm/xe=3A_Invalidate_media=5Fgt_?=
 =?utf-8?q?TLBs_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 20 Aug 2024 16:53:03 -0000
Message-ID: <172417278397.700411.12826748626479284605@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240820155748.984581-1-matthew.brost@intel.com>
In-Reply-To: <20240820155748.984581-1-matthew.brost@intel.com>
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

--===============5662159229340874247==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Invalidate media_gt TLBs (rev2)
URL   : https://patchwork.freedesktop.org/series/137417/
State : failure

== Summary ==

CI Bug Log - changes from xe-1799-5287d615dcd1e37c2f818ad0a5f2cfc3e25710a5_BAT -> xe-pw-137417v2_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-137417v2_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-137417v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-137417v2_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_fault_mode@twice-userptr-invalidate:
    - bat-lnl-1:          [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1799-5287d615dcd1e37c2f818ad0a5f2cfc3e25710a5/bat-lnl-1/igt@xe_exec_fault_mode@twice-userptr-invalidate.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137417v2/bat-lnl-1/igt@xe_exec_fault_mode@twice-userptr-invalidate.html
    - bat-pvc-2:          [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1799-5287d615dcd1e37c2f818ad0a5f2cfc3e25710a5/bat-pvc-2/igt@xe_exec_fault_mode@twice-userptr-invalidate.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137417v2/bat-pvc-2/igt@xe_exec_fault_mode@twice-userptr-invalidate.html
    - bat-bmg-1:          [PASS][5] -> [ABORT][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1799-5287d615dcd1e37c2f818ad0a5f2cfc3e25710a5/bat-bmg-1/igt@xe_exec_fault_mode@twice-userptr-invalidate.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137417v2/bat-bmg-1/igt@xe_exec_fault_mode@twice-userptr-invalidate.html
    - bat-lnl-2:          [PASS][7] -> [ABORT][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1799-5287d615dcd1e37c2f818ad0a5f2cfc3e25710a5/bat-lnl-2/igt@xe_exec_fault_mode@twice-userptr-invalidate.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137417v2/bat-lnl-2/igt@xe_exec_fault_mode@twice-userptr-invalidate.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@xe_exec_fault_mode@twice-userptr-invalidate:
    - {bat-bmg-2}:        [PASS][9] -> [ABORT][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1799-5287d615dcd1e37c2f818ad0a5f2cfc3e25710a5/bat-bmg-2/igt@xe_exec_fault_mode@twice-userptr-invalidate.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137417v2/bat-bmg-2/igt@xe_exec_fault_mode@twice-userptr-invalidate.html

  
Known issues
------------

  Here are the changes found in xe-pw-137417v2_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_addfb_basic@bad-pitch-32:
    - bat-bmg-1:          [DMESG-WARN][11] ([Intel XE#877]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1799-5287d615dcd1e37c2f818ad0a5f2cfc3e25710a5/bat-bmg-1/igt@kms_addfb_basic@bad-pitch-32.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137417v2/bat-bmg-1/igt@kms_addfb_basic@bad-pitch-32.html

  * igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate:
    - bat-lnl-1:          [FAIL][13] ([Intel XE#1069]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1799-5287d615dcd1e37c2f818ad0a5f2cfc3e25710a5/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137417v2/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877


Build changes
-------------

  * IGT: IGT_7978 -> IGT_7979
  * Linux: xe-1799-5287d615dcd1e37c2f818ad0a5f2cfc3e25710a5 -> xe-pw-137417v2

  IGT_7978: 4083a9d8abc80c8a905ffdc20bc76383b1e07e79 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7979: 403645635240cf6b72455731d0f086278b05e456 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1799-5287d615dcd1e37c2f818ad0a5f2cfc3e25710a5: 5287d615dcd1e37c2f818ad0a5f2cfc3e25710a5
  xe-pw-137417v2: 137417v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137417v2/index.html

--===============5662159229340874247==
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
<tr><td><b>Series:</b></td><td>drm/xe: Invalidate media_gt TLBs (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137417/">https://patchwork.freedesktop.org/series/137417/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137417v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137417v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1799-5287d615dcd1e37c2f818ad0a5f2cfc3e25710a5_BAT -&gt; xe-pw-137417v2_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-137417v2_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-137417v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-137417v2_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_exec_fault_mode@twice-userptr-invalidate:<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1799-5287d615dcd1e37c2f818ad0a5f2cfc3e25710a5/bat-lnl-1/igt@xe_exec_fault_mode@twice-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137417v2/bat-lnl-1/igt@xe_exec_fault_mode@twice-userptr-invalidate.html">ABORT</a></li>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1799-5287d615dcd1e37c2f818ad0a5f2cfc3e25710a5/bat-pvc-2/igt@xe_exec_fault_mode@twice-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137417v2/bat-pvc-2/igt@xe_exec_fault_mode@twice-userptr-invalidate.html">INCOMPLETE</a></li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1799-5287d615dcd1e37c2f818ad0a5f2cfc3e25710a5/bat-bmg-1/igt@xe_exec_fault_mode@twice-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137417v2/bat-bmg-1/igt@xe_exec_fault_mode@twice-userptr-invalidate.html">ABORT</a></li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1799-5287d615dcd1e37c2f818ad0a5f2cfc3e25710a5/bat-lnl-2/igt@xe_exec_fault_mode@twice-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137417v2/bat-lnl-2/igt@xe_exec_fault_mode@twice-userptr-invalidate.html">ABORT</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@xe_exec_fault_mode@twice-userptr-invalidate:<ul>
<li>{bat-bmg-2}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1799-5287d615dcd1e37c2f818ad0a5f2cfc3e25710a5/bat-bmg-2/igt@xe_exec_fault_mode@twice-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137417v2/bat-bmg-2/igt@xe_exec_fault_mode@twice-userptr-invalidate.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-137417v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@bad-pitch-32:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1799-5287d615dcd1e37c2f818ad0a5f2cfc3e25710a5/bat-bmg-1/igt@kms_addfb_basic@bad-pitch-32.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137417v2/bat-bmg-1/igt@kms_addfb_basic@bad-pitch-32.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1799-5287d615dcd1e37c2f818ad0a5f2cfc3e25710a5/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069">Intel XE#1069</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137417v2/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7978 -&gt; IGT_7979</li>
<li>Linux: xe-1799-5287d615dcd1e37c2f818ad0a5f2cfc3e25710a5 -&gt; xe-pw-137417v2</li>
</ul>
<p>IGT_7978: 4083a9d8abc80c8a905ffdc20bc76383b1e07e79 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7979: 403645635240cf6b72455731d0f086278b05e456 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1799-5287d615dcd1e37c2f818ad0a5f2cfc3e25710a5: 5287d615dcd1e37c2f818ad0a5f2cfc3e25710a5<br />
  xe-pw-137417v2: 137417v2</p>

</body>
</html>

--===============5662159229340874247==--
