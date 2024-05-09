Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBD03C10F1A
	for <intel-xe@archiver.kernel.org>; Thu,  9 May 2024 19:42:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FEB210EE70;
	Thu,  9 May 2024 19:42:39 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C3AD10EE70;
 Thu,  9 May 2024 19:42:38 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7316085815920049170=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_series_starting_with_=5BCI=2C1/5?=
 =?utf-8?q?=5D_drm/xe=3A_Drop_=5F=5Fengine=5Fmask_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 09 May 2024 19:42:38 -0000
Message-ID: <171528375804.2038581.4755007842137639121@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240509041225.610636-1-lucas.demarchi@intel.com>
In-Reply-To: <20240509041225.610636-1-lucas.demarchi@intel.com>
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

--===============7316085815920049170==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [CI,1/5] drm/xe: Drop __engine_mask (rev2)
URL   : https://patchwork.freedesktop.org/series/133360/
State : failure

== Summary ==

CI Bug Log - changes from xe-1264-31ab65c31f1818741354092fba7308fba098b1cd_BAT -> xe-pw-133360v2_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-133360v2_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-133360v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-133360v2_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:
    - bat-atsm-2:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1264-31ab65c31f1818741354092fba7308fba098b1cd/bat-atsm-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133360v2/bat-atsm-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html

  * igt@xe_evict_ccs@evict-overcommit-simple:
    - bat-atsm-2:         [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1264-31ab65c31f1818741354092fba7308fba098b1cd/bat-atsm-2/igt@xe_evict_ccs@evict-overcommit-simple.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133360v2/bat-atsm-2/igt@xe_evict_ccs@evict-overcommit-simple.html

  * igt@xe_gt_freq@freq_range_idle:
    - bat-dg2-oem2:       [PASS][5] -> [SKIP][6] +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1264-31ab65c31f1818741354092fba7308fba098b1cd/bat-dg2-oem2/igt@xe_gt_freq@freq_range_idle.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133360v2/bat-dg2-oem2/igt@xe_gt_freq@freq_range_idle.html

  * igt@xe_live_ktest@xe_migrate:
    - bat-adlp-7:         [PASS][7] -> [FAIL][8] +1 other test fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1264-31ab65c31f1818741354092fba7308fba098b1cd/bat-adlp-7/igt@xe_live_ktest@xe_migrate.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133360v2/bat-adlp-7/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_pm_residency@gt-c6-on-idle:
    - bat-dg2-oem2:       [PASS][9] -> [FAIL][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1264-31ab65c31f1818741354092fba7308fba098b1cd/bat-dg2-oem2/igt@xe_pm_residency@gt-c6-on-idle.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133360v2/bat-dg2-oem2/igt@xe_pm_residency@gt-c6-on-idle.html

  
Known issues
------------

  Here are the changes found in xe-pw-133360v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-dp-3:
    - bat-dg2-oem2:       [PASS][11] -> [DMESG-WARN][12] ([Intel XE#1602] / [Intel XE#358]) +3 other tests dmesg-warn
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1264-31ab65c31f1818741354092fba7308fba098b1cd/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-dp-3.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133360v2/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-dp-3.html

  * igt@xe_exec_balancer@twice-virtual-userptr-rebind:
    - bat-dg2-oem2:       [PASS][13] -> [DMESG-FAIL][14] ([Intel XE#358]) +3 other tests dmesg-fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1264-31ab65c31f1818741354092fba7308fba098b1cd/bat-dg2-oem2/igt@xe_exec_balancer@twice-virtual-userptr-rebind.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133360v2/bat-dg2-oem2/igt@xe_exec_balancer@twice-virtual-userptr-rebind.html

  * igt@xe_exec_compute_mode@twice-bindexecqueue-userptr:
    - bat-pvc-2:          [PASS][15] -> [INCOMPLETE][16] ([Intel XE#1044])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1264-31ab65c31f1818741354092fba7308fba098b1cd/bat-pvc-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133360v2/bat-pvc-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr.html

  * igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-rebind:
    - bat-dg2-oem2:       [PASS][17] -> [FAIL][18] ([Intel XE#1069])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1264-31ab65c31f1818741354092fba7308fba098b1cd/bat-dg2-oem2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-rebind.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133360v2/bat-dg2-oem2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-rebind.html

  * igt@xe_intel_bb@create-in-region:
    - bat-dg2-oem2:       [PASS][19] -> [DMESG-WARN][20] ([Intel XE#1602]) +95 other tests dmesg-warn
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1264-31ab65c31f1818741354092fba7308fba098b1cd/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133360v2/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html

  * igt@xe_intel_bb@intel-bb-blit-y:
    - bat-dg2-oem2:       [PASS][21] -> [DMESG-FAIL][22] ([Intel XE#1602] / [Intel XE#358]) +15 other tests dmesg-fail
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1264-31ab65c31f1818741354092fba7308fba098b1cd/bat-dg2-oem2/igt@xe_intel_bb@intel-bb-blit-y.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133360v2/bat-dg2-oem2/igt@xe_intel_bb@intel-bb-blit-y.html

  * igt@xe_prime_self_import@basic-with_fd_dup:
    - bat-dg2-oem2:       [PASS][23] -> [DMESG-FAIL][24] ([Intel XE#1602]) +10 other tests dmesg-fail
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1264-31ab65c31f1818741354092fba7308fba098b1cd/bat-dg2-oem2/igt@xe_prime_self_import@basic-with_fd_dup.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133360v2/bat-dg2-oem2/igt@xe_prime_self_import@basic-with_fd_dup.html

  * igt@xe_vm@shared-pte-page:
    - bat-dg2-oem2:       [PASS][25] -> [INCOMPLETE][26] ([Intel XE#1602])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1264-31ab65c31f1818741354092fba7308fba098b1cd/bat-dg2-oem2/igt@xe_vm@shared-pte-page.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133360v2/bat-dg2-oem2/igt@xe_vm@shared-pte-page.html

  
  [Intel XE#1044]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044
  [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
  [Intel XE#1602]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1602
  [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358


Build changes
-------------

  * Linux: xe-1264-31ab65c31f1818741354092fba7308fba098b1cd -> xe-pw-133360v2

  IGT_7846: 4a5fd4e7cb2798636f6464e2bd61399f3242b322 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1264-31ab65c31f1818741354092fba7308fba098b1cd: 31ab65c31f1818741354092fba7308fba098b1cd
  xe-pw-133360v2: 133360v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133360v2/index.html

--===============7316085815920049170==
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
<tr><td><b>Series:</b></td><td>series starting with [CI,1/5] drm/xe: Drop __engine_mask (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/133360/">https://patchwork.freedesktop.org/series/133360/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133360v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133360v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1264-31ab65c31f1818741354092fba7308fba098b1cd_BAT -&gt; xe-pw-133360v2_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-133360v2_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-133360v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-133360v2_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1264-31ab65c31f1818741354092fba7308fba098b1cd/bat-atsm-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133360v2/bat-atsm-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-simple:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1264-31ab65c31f1818741354092fba7308fba098b1cd/bat-atsm-2/igt@xe_evict_ccs@evict-overcommit-simple.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133360v2/bat-atsm-2/igt@xe_evict_ccs@evict-overcommit-simple.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_range_idle:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1264-31ab65c31f1818741354092fba7308fba098b1cd/bat-dg2-oem2/igt@xe_gt_freq@freq_range_idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133360v2/bat-dg2-oem2/igt@xe_gt_freq@freq_range_idle.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1264-31ab65c31f1818741354092fba7308fba098b1cd/bat-adlp-7/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133360v2/bat-adlp-7/igt@xe_live_ktest@xe_migrate.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-on-idle:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1264-31ab65c31f1818741354092fba7308fba098b1cd/bat-dg2-oem2/igt@xe_pm_residency@gt-c6-on-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133360v2/bat-dg2-oem2/igt@xe_pm_residency@gt-c6-on-idle.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-133360v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-dp-3:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1264-31ab65c31f1818741354092fba7308fba098b1cd/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-dp-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133360v2/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-dp-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1602">Intel XE#1602</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-virtual-userptr-rebind:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1264-31ab65c31f1818741354092fba7308fba098b1cd/bat-dg2-oem2/igt@xe_exec_balancer@twice-virtual-userptr-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133360v2/bat-dg2-oem2/igt@xe_exec_balancer@twice-virtual-userptr-rebind.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>) +3 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-bindexecqueue-userptr:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1264-31ab65c31f1818741354092fba7308fba098b1cd/bat-pvc-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133360v2/bat-pvc-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044">Intel XE#1044</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-rebind:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1264-31ab65c31f1818741354092fba7308fba098b1cd/bat-dg2-oem2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133360v2/bat-dg2-oem2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-rebind.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069">Intel XE#1069</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@create-in-region:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1264-31ab65c31f1818741354092fba7308fba098b1cd/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133360v2/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1602">Intel XE#1602</a>) +95 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@intel-bb-blit-y:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1264-31ab65c31f1818741354092fba7308fba098b1cd/bat-dg2-oem2/igt@xe_intel_bb@intel-bb-blit-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133360v2/bat-dg2-oem2/igt@xe_intel_bb@intel-bb-blit-y.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1602">Intel XE#1602</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>) +15 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@xe_prime_self_import@basic-with_fd_dup:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1264-31ab65c31f1818741354092fba7308fba098b1cd/bat-dg2-oem2/igt@xe_prime_self_import@basic-with_fd_dup.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133360v2/bat-dg2-oem2/igt@xe_prime_self_import@basic-with_fd_dup.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1602">Intel XE#1602</a>) +10 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@xe_vm@shared-pte-page:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1264-31ab65c31f1818741354092fba7308fba098b1cd/bat-dg2-oem2/igt@xe_vm@shared-pte-page.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133360v2/bat-dg2-oem2/igt@xe_vm@shared-pte-page.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1602">Intel XE#1602</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1264-31ab65c31f1818741354092fba7308fba098b1cd -&gt; xe-pw-133360v2</li>
</ul>
<p>IGT_7846: 4a5fd4e7cb2798636f6464e2bd61399f3242b322 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1264-31ab65c31f1818741354092fba7308fba098b1cd: 31ab65c31f1818741354092fba7308fba098b1cd<br />
  xe-pw-133360v2: 133360v2</p>

</body>
</html>

--===============7316085815920049170==--
