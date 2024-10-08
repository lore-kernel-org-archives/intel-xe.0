Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4592CED274
	for <intel-xe@archiver.kernel.org>; Tue,  8 Oct 2024 08:12:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABFEA10E48C;
	Tue,  8 Oct 2024 08:12:12 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B941A10E48C;
 Tue,  8 Oct 2024 08:12:11 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2204718210741686698=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_Fix_xe=5Fforce=5Fwake=5Fget=28?=
 =?utf-8?q?=29_failure_handling_=28rev9=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 08 Oct 2024 08:12:11 -0000
Message-ID: <172837513175.1202441.5423282141475917517@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241008071115.1862704-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20241008071115.1862704-1-himal.prasad.ghimiray@intel.com>
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

--===============2204718210741686698==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fix xe_force_wake_get() failure handling (rev9)
URL   : https://patchwork.freedesktop.org/series/137982/
State : failure

== Summary ==

CI Bug Log - changes from xe-2021-fc6867c683c18ec3ac31682fd37d418d8a8ebde1_BAT -> xe-pw-137982v9_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-137982v9_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-137982v9_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): bat-adlp-vf 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-137982v9_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_gt_freq@freq_fixed_idle:
    - bat-lnl-1:          [PASS][1] -> [SKIP][2] +1 other test skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2021-fc6867c683c18ec3ac31682fd37d418d8a8ebde1/bat-lnl-1/igt@xe_gt_freq@freq_fixed_idle.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v9/bat-lnl-1/igt@xe_gt_freq@freq_fixed_idle.html
    - bat-bmg-1:          [PASS][3] -> [SKIP][4] +1 other test skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2021-fc6867c683c18ec3ac31682fd37d418d8a8ebde1/bat-bmg-1/igt@xe_gt_freq@freq_fixed_idle.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v9/bat-bmg-1/igt@xe_gt_freq@freq_fixed_idle.html
    - bat-lnl-2:          [PASS][5] -> [SKIP][6] +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2021-fc6867c683c18ec3ac31682fd37d418d8a8ebde1/bat-lnl-2/igt@xe_gt_freq@freq_fixed_idle.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v9/bat-lnl-2/igt@xe_gt_freq@freq_fixed_idle.html

  * igt@xe_gt_freq@freq_range_idle:
    - bat-dg2-oem2:       [PASS][7] -> [SKIP][8] +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2021-fc6867c683c18ec3ac31682fd37d418d8a8ebde1/bat-dg2-oem2/igt@xe_gt_freq@freq_range_idle.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v9/bat-dg2-oem2/igt@xe_gt_freq@freq_range_idle.html

  * igt@xe_module_load@load:
    - bat-atsm-2:         [PASS][9] -> [ABORT][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2021-fc6867c683c18ec3ac31682fd37d418d8a8ebde1/bat-atsm-2/igt@xe_module_load@load.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v9/bat-atsm-2/igt@xe_module_load@load.html
    - bat-adlp-7:         [PASS][11] -> [ABORT][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2021-fc6867c683c18ec3ac31682fd37d418d8a8ebde1/bat-adlp-7/igt@xe_module_load@load.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v9/bat-adlp-7/igt@xe_module_load@load.html

  * igt@xe_pm_residency@gt-c6-on-idle@gt0:
    - bat-lnl-1:          [PASS][13] -> [FAIL][14] +2 other tests fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2021-fc6867c683c18ec3ac31682fd37d418d8a8ebde1/bat-lnl-1/igt@xe_pm_residency@gt-c6-on-idle@gt0.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v9/bat-lnl-1/igt@xe_pm_residency@gt-c6-on-idle@gt0.html
    - bat-dg2-oem2:       [PASS][15] -> [FAIL][16] +1 other test fail
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2021-fc6867c683c18ec3ac31682fd37d418d8a8ebde1/bat-dg2-oem2/igt@xe_pm_residency@gt-c6-on-idle@gt0.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v9/bat-dg2-oem2/igt@xe_pm_residency@gt-c6-on-idle@gt0.html

  * igt@xe_pm_residency@gt-c6-on-idle@gt1:
    - bat-bmg-1:          [PASS][17] -> [FAIL][18] +2 other tests fail
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2021-fc6867c683c18ec3ac31682fd37d418d8a8ebde1/bat-bmg-1/igt@xe_pm_residency@gt-c6-on-idle@gt1.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v9/bat-bmg-1/igt@xe_pm_residency@gt-c6-on-idle@gt1.html
    - bat-lnl-2:          [PASS][19] -> [FAIL][20] +2 other tests fail
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2021-fc6867c683c18ec3ac31682fd37d418d8a8ebde1/bat-lnl-2/igt@xe_pm_residency@gt-c6-on-idle@gt1.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v9/bat-lnl-2/igt@xe_pm_residency@gt-c6-on-idle@gt1.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@xe_gt_freq@freq_fixed_idle:
    - {bat-bmg-2}:        [PASS][21] -> [SKIP][22] +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2021-fc6867c683c18ec3ac31682fd37d418d8a8ebde1/bat-bmg-2/igt@xe_gt_freq@freq_fixed_idle.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v9/bat-bmg-2/igt@xe_gt_freq@freq_fixed_idle.html

  * igt@xe_pm_residency@gt-c6-on-idle@gt1:
    - {bat-bmg-2}:        [PASS][23] -> [FAIL][24] +2 other tests fail
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2021-fc6867c683c18ec3ac31682fd37d418d8a8ebde1/bat-bmg-2/igt@xe_pm_residency@gt-c6-on-idle@gt1.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v9/bat-bmg-2/igt@xe_pm_residency@gt-c6-on-idle@gt1.html

  
Known issues
------------

  Here are the changes found in xe-pw-137982v9_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:
    - bat-lnl-1:          [FAIL][25] ([Intel XE#886]) -> [PASS][26]
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2021-fc6867c683c18ec3ac31682fd37d418d8a8ebde1/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v9/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - bat-bmg-1:          [DMESG-WARN][27] ([Intel XE#877]) -> [PASS][28] +1 other test pass
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2021-fc6867c683c18ec3ac31682fd37d418d8a8ebde1/bat-bmg-1/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v9/bat-bmg-1/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886


Build changes
-------------

  * IGT: IGT_8054 -> IGT_8055
  * Linux: xe-2021-fc6867c683c18ec3ac31682fd37d418d8a8ebde1 -> xe-pw-137982v9

  IGT_8054: 3f627b7fd48c6ab324ceaa80dd8cf0131292bf63 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8055: 8055
  xe-2021-fc6867c683c18ec3ac31682fd37d418d8a8ebde1: fc6867c683c18ec3ac31682fd37d418d8a8ebde1
  xe-pw-137982v9: 137982v9

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v9/index.html

--===============2204718210741686698==
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
<tr><td><b>Series:</b></td><td>Fix xe_force_wake_get() failure handling (rev9)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137982/">https://patchwork.freedesktop.org/series/137982/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v9/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v9/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2021-fc6867c683c18ec3ac31682fd37d418d8a8ebde1_BAT -&gt; xe-pw-137982v9_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-137982v9_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-137982v9_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vf </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-137982v9_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_gt_freq@freq_fixed_idle:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2021-fc6867c683c18ec3ac31682fd37d418d8a8ebde1/bat-lnl-1/igt@xe_gt_freq@freq_fixed_idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v9/bat-lnl-1/igt@xe_gt_freq@freq_fixed_idle.html">SKIP</a> +1 other test skip</li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2021-fc6867c683c18ec3ac31682fd37d418d8a8ebde1/bat-bmg-1/igt@xe_gt_freq@freq_fixed_idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v9/bat-bmg-1/igt@xe_gt_freq@freq_fixed_idle.html">SKIP</a> +1 other test skip</li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2021-fc6867c683c18ec3ac31682fd37d418d8a8ebde1/bat-lnl-2/igt@xe_gt_freq@freq_fixed_idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v9/bat-lnl-2/igt@xe_gt_freq@freq_fixed_idle.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_range_idle:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2021-fc6867c683c18ec3ac31682fd37d418d8a8ebde1/bat-dg2-oem2/igt@xe_gt_freq@freq_range_idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v9/bat-dg2-oem2/igt@xe_gt_freq@freq_range_idle.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2021-fc6867c683c18ec3ac31682fd37d418d8a8ebde1/bat-atsm-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v9/bat-atsm-2/igt@xe_module_load@load.html">ABORT</a></li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2021-fc6867c683c18ec3ac31682fd37d418d8a8ebde1/bat-adlp-7/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v9/bat-adlp-7/igt@xe_module_load@load.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-on-idle@gt0:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2021-fc6867c683c18ec3ac31682fd37d418d8a8ebde1/bat-lnl-1/igt@xe_pm_residency@gt-c6-on-idle@gt0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v9/bat-lnl-1/igt@xe_pm_residency@gt-c6-on-idle@gt0.html">FAIL</a> +2 other tests fail</li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2021-fc6867c683c18ec3ac31682fd37d418d8a8ebde1/bat-dg2-oem2/igt@xe_pm_residency@gt-c6-on-idle@gt0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v9/bat-dg2-oem2/igt@xe_pm_residency@gt-c6-on-idle@gt0.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-on-idle@gt1:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2021-fc6867c683c18ec3ac31682fd37d418d8a8ebde1/bat-bmg-1/igt@xe_pm_residency@gt-c6-on-idle@gt1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v9/bat-bmg-1/igt@xe_pm_residency@gt-c6-on-idle@gt1.html">FAIL</a> +2 other tests fail</li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2021-fc6867c683c18ec3ac31682fd37d418d8a8ebde1/bat-lnl-2/igt@xe_pm_residency@gt-c6-on-idle@gt1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v9/bat-lnl-2/igt@xe_pm_residency@gt-c6-on-idle@gt1.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@xe_gt_freq@freq_fixed_idle:</p>
<ul>
<li>{bat-bmg-2}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2021-fc6867c683c18ec3ac31682fd37d418d8a8ebde1/bat-bmg-2/igt@xe_gt_freq@freq_fixed_idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v9/bat-bmg-2/igt@xe_gt_freq@freq_fixed_idle.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-on-idle@gt1:</p>
<ul>
<li>{bat-bmg-2}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2021-fc6867c683c18ec3ac31682fd37d418d8a8ebde1/bat-bmg-2/igt@xe_pm_residency@gt-c6-on-idle@gt1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v9/bat-bmg-2/igt@xe_pm_residency@gt-c6-on-idle@gt1.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-137982v9_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2021-fc6867c683c18ec3ac31682fd37d418d8a8ebde1/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v9/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2021-fc6867c683c18ec3ac31682fd37d418d8a8ebde1/bat-bmg-1/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v9/bat-bmg-1/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8054 -&gt; IGT_8055</li>
<li>Linux: xe-2021-fc6867c683c18ec3ac31682fd37d418d8a8ebde1 -&gt; xe-pw-137982v9</li>
</ul>
<p>IGT_8054: 3f627b7fd48c6ab324ceaa80dd8cf0131292bf63 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8055: 8055<br />
  xe-2021-fc6867c683c18ec3ac31682fd37d418d8a8ebde1: fc6867c683c18ec3ac31682fd37d418d8a8ebde1<br />
  xe-pw-137982v9: 137982v9</p>

</body>
</html>

--===============2204718210741686698==--
