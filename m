Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B10DCE7B17
	for <intel-xe@archiver.kernel.org>; Thu, 28 Sep 2023 10:15:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4AB410E0AB;
	Thu, 28 Sep 2023 10:15:56 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id C2B4F10E0CB;
 Thu, 28 Sep 2023 10:15:53 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id BC592AADF1;
 Thu, 28 Sep 2023 10:15:53 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7056295382927950658=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Souza, Jose" <jose.souza@intel.com>
Date: Thu, 28 Sep 2023 10:15:53 -0000
Message-ID: <169589615373.21268.16623036831147974974@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230928092816.375130-7-matthew.auld@intel.com>
In-Reply-To: <20230928092816.375130-7-matthew.auld@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_PAT_and_c?=
 =?utf-8?q?ache_coherency_support_=28rev6=29?=
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

--===============7056295382927950658==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: PAT and cache coherency support (rev6)
URL   : https://patchwork.freedesktop.org/series/123027/
State : failure

== Summary ==

CI Bug Log - changes from xe-399-7c58b58522cf124dd324fbf95d9dd838fac36bcb_BAT -> xe-pw-123027v6_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-123027v6_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-123027v6_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-123027v6_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_addfb_basic@addfb25-yf-tiled-legacy:
    - bat-adlp-7:         [PASS][1] -> [WARN][2] +8 other tests warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-399-7c58b58522cf124dd324fbf95d9dd838fac36bcb/bat-adlp-7/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v6/bat-adlp-7/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html

  * igt@kms_addfb_basic@too-wide:
    - bat-dg2-oem2:       [PASS][3] -> [WARN][4] +7 other tests warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-399-7c58b58522cf124dd324fbf95d9dd838fac36bcb/bat-dg2-oem2/igt@kms_addfb_basic@too-wide.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v6/bat-dg2-oem2/igt@kms_addfb_basic@too-wide.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-edp-1:
    - bat-adlp-7:         NOTRUN -> [FAIL][5] +37 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v6/bat-adlp-7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-edp-1.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:
    - bat-pvc-2:          [PASS][6] -> [FAIL][7] +115 other tests fail
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-399-7c58b58522cf124dd324fbf95d9dd838fac36bcb/bat-pvc-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v6/bat-pvc-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html

  * igt@xe_intel_bb@create-in-region:
    - bat-dg2-oem2:       [PASS][8] -> [FAIL][9] +147 other tests fail
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-399-7c58b58522cf124dd324fbf95d9dd838fac36bcb/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v6/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html
    - bat-adlp-7:         [PASS][10] -> [FAIL][11] +84 other tests fail
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-399-7c58b58522cf124dd324fbf95d9dd838fac36bcb/bat-adlp-7/igt@xe_intel_bb@create-in-region.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v6/bat-adlp-7/igt@xe_intel_bb@create-in-region.html

  * igt@xe_live_ktest@migrate:
    - bat-adlp-7:         NOTRUN -> [INCOMPLETE][12]
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v6/bat-adlp-7/igt@xe_live_ktest@migrate.html

  * igt@xe_prime_self_import@basic-with_one_bo:
    - bat-atsm-2:         [PASS][13] -> [FAIL][14] +88 other tests fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-399-7c58b58522cf124dd324fbf95d9dd838fac36bcb/bat-atsm-2/igt@xe_prime_self_import@basic-with_one_bo.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v6/bat-atsm-2/igt@xe_prime_self_import@basic-with_one_bo.html

  
#### Warnings ####

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - bat-dg2-oem2:       [SKIP][15] ([Intel XE#624]) -> [FAIL][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-399-7c58b58522cf124dd324fbf95d9dd838fac36bcb/bat-dg2-oem2/igt@kms_addfb_basic@basic-y-tiled-legacy.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v6/bat-dg2-oem2/igt@kms_addfb_basic@basic-y-tiled-legacy.html
    - bat-adlp-7:         [FAIL][17] ([Intel XE#609]) -> [FAIL][18] +1 other test fail
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-399-7c58b58522cf124dd324fbf95d9dd838fac36bcb/bat-adlp-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v6/bat-adlp-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_addfb_basic@tile-pitch-mismatch:
    - bat-dg2-oem2:       [FAIL][19] ([Intel XE#609]) -> [FAIL][20]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-399-7c58b58522cf124dd324fbf95d9dd838fac36bcb/bat-dg2-oem2/igt@kms_addfb_basic@tile-pitch-mismatch.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v6/bat-dg2-oem2/igt@kms_addfb_basic@tile-pitch-mismatch.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:
    - bat-adlp-7:         [FAIL][21] ([Intel XE#480]) -> [FAIL][22] +2 other tests fail
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-399-7c58b58522cf124dd324fbf95d9dd838fac36bcb/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v6/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-dg2-oem2:       [FAIL][23] ([Intel XE#608]) -> [FAIL][24]
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-399-7c58b58522cf124dd324fbf95d9dd838fac36bcb/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v6/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html
    - bat-adlp-7:         [INCOMPLETE][25] ([Intel XE#632]) -> [FAIL][26]
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-399-7c58b58522cf124dd324fbf95d9dd838fac36bcb/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v6/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:
    - bat-dg2-oem2:       [FAIL][27] ([Intel XE#400]) -> [FAIL][28] +2 other tests fail
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-399-7c58b58522cf124dd324fbf95d9dd838fac36bcb/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v6/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html

  * igt@xe_evict@evict-beng-small-external:
    - bat-pvc-2:          [FAIL][29] ([Intel XE#389]) -> [FAIL][30] +3 other tests fail
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-399-7c58b58522cf124dd324fbf95d9dd838fac36bcb/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v6/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html

  * igt@xe_evict@evict-small-cm:
    - bat-pvc-2:          [DMESG-FAIL][31] ([Intel XE#482]) -> [FAIL][32] +3 other tests fail
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-399-7c58b58522cf124dd324fbf95d9dd838fac36bcb/bat-pvc-2/igt@xe_evict@evict-small-cm.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v6/bat-pvc-2/igt@xe_evict@evict-small-cm.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@xe_exec_basic@no-exec-bindexecqueue}:
    - bat-dg2-oem2:       [PASS][33] -> [FAIL][34] +5 other tests fail
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-399-7c58b58522cf124dd324fbf95d9dd838fac36bcb/bat-dg2-oem2/igt@xe_exec_basic@no-exec-bindexecqueue.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v6/bat-dg2-oem2/igt@xe_exec_basic@no-exec-bindexecqueue.html

  * {igt@xe_exec_compute_mode@twice-bindexecqueue}:
    - bat-atsm-2:         [PASS][35] -> [FAIL][36] +5 other tests fail
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-399-7c58b58522cf124dd324fbf95d9dd838fac36bcb/bat-atsm-2/igt@xe_exec_compute_mode@twice-bindexecqueue.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v6/bat-atsm-2/igt@xe_exec_compute_mode@twice-bindexecqueue.html

  * {igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate}:
    - bat-pvc-2:          [PASS][37] -> [FAIL][38] +26 other tests fail
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-399-7c58b58522cf124dd324fbf95d9dd838fac36bcb/bat-pvc-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v6/bat-pvc-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html

  * {igt@xe_vm@bind-execqueues-independent}:
    - bat-adlp-7:         [PASS][39] -> [FAIL][40] +5 other tests fail
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-399-7c58b58522cf124dd324fbf95d9dd838fac36bcb/bat-adlp-7/igt@xe_vm@bind-execqueues-independent.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v6/bat-adlp-7/igt@xe_vm@bind-execqueues-independent.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#389]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/389
  [Intel XE#400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/400
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/482
  [Intel XE#608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/608
  [Intel XE#609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/609
  [Intel XE#624]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/624
  [Intel XE#632]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/632


Build changes
-------------

  * Linux: xe-399-7c58b58522cf124dd324fbf95d9dd838fac36bcb -> xe-pw-123027v6

  IGT_7506: 4fdf544bd0a38c5a100ef43c30171827e1c8c442 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-399-7c58b58522cf124dd324fbf95d9dd838fac36bcb: 7c58b58522cf124dd324fbf95d9dd838fac36bcb
  xe-pw-123027v6: 123027v6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v6/index.html

--===============7056295382927950658==
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
<tr><td><b>Series:</b></td><td>PAT and cache coherency support (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/123027/">https://patchwork.freedesktop.org/series/123027/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v6/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v6/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-399-7c58b58522cf124dd324fbf95d9dd838fac36bcb_BAT -&gt; xe-pw-123027v6_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-123027v6_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-123027v6_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-123027v6_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-yf-tiled-legacy:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-399-7c58b58522cf124dd324fbf95d9dd838fac36bcb/bat-adlp-7/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v6/bat-adlp-7/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html">WARN</a> +8 other tests warn</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@too-wide:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-399-7c58b58522cf124dd324fbf95d9dd838fac36bcb/bat-dg2-oem2/igt@kms_addfb_basic@too-wide.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v6/bat-dg2-oem2/igt@kms_addfb_basic@too-wide.html">WARN</a> +7 other tests warn</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-edp-1:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v6/bat-adlp-7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-edp-1.html">FAIL</a> +37 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-399-7c58b58522cf124dd324fbf95d9dd838fac36bcb/bat-pvc-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v6/bat-pvc-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">FAIL</a> +115 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@create-in-region:</p>
<ul>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-399-7c58b58522cf124dd324fbf95d9dd838fac36bcb/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v6/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html">FAIL</a> +147 other tests fail</p>
</li>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-399-7c58b58522cf124dd324fbf95d9dd838fac36bcb/bat-adlp-7/igt@xe_intel_bb@create-in-region.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v6/bat-adlp-7/igt@xe_intel_bb@create-in-region.html">FAIL</a> +84 other tests fail</p>
</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@migrate:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v6/bat-adlp-7/igt@xe_live_ktest@migrate.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_prime_self_import@basic-with_one_bo:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-399-7c58b58522cf124dd324fbf95d9dd838fac36bcb/bat-atsm-2/igt@xe_prime_self_import@basic-with_one_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v6/bat-atsm-2/igt@xe_prime_self_import@basic-with_one_bo.html">FAIL</a> +88 other tests fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
<ul>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-399-7c58b58522cf124dd324fbf95d9dd838fac36bcb/bat-dg2-oem2/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/624">Intel XE#624</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v6/bat-dg2-oem2/igt@kms_addfb_basic@basic-y-tiled-legacy.html">FAIL</a></p>
</li>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-399-7c58b58522cf124dd324fbf95d9dd838fac36bcb/bat-adlp-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/609">Intel XE#609</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v6/bat-adlp-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html">FAIL</a> +1 other test fail</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@tile-pitch-mismatch:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-399-7c58b58522cf124dd324fbf95d9dd838fac36bcb/bat-dg2-oem2/igt@kms_addfb_basic@tile-pitch-mismatch.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/609">Intel XE#609</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v6/bat-dg2-oem2/igt@kms_addfb_basic@tile-pitch-mismatch.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-399-7c58b58522cf124dd324fbf95d9dd838fac36bcb/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v6/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-399-7c58b58522cf124dd324fbf95d9dd838fac36bcb/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/608">Intel XE#608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v6/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html">FAIL</a></p>
</li>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-399-7c58b58522cf124dd324fbf95d9dd838fac36bcb/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/632">Intel XE#632</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v6/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-399-7c58b58522cf124dd324fbf95d9dd838fac36bcb/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/400">Intel XE#400</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v6/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-external:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-399-7c58b58522cf124dd324fbf95d9dd838fac36bcb/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/389">Intel XE#389</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v6/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-cm:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-399-7c58b58522cf124dd324fbf95d9dd838fac36bcb/bat-pvc-2/igt@xe_evict@evict-small-cm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/482">Intel XE#482</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v6/bat-pvc-2/igt@xe_evict@evict-small-cm.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@xe_exec_basic@no-exec-bindexecqueue}:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-399-7c58b58522cf124dd324fbf95d9dd838fac36bcb/bat-dg2-oem2/igt@xe_exec_basic@no-exec-bindexecqueue.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v6/bat-dg2-oem2/igt@xe_exec_basic@no-exec-bindexecqueue.html">FAIL</a> +5 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@xe_exec_compute_mode@twice-bindexecqueue}:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-399-7c58b58522cf124dd324fbf95d9dd838fac36bcb/bat-atsm-2/igt@xe_exec_compute_mode@twice-bindexecqueue.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v6/bat-atsm-2/igt@xe_exec_compute_mode@twice-bindexecqueue.html">FAIL</a> +5 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate}:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-399-7c58b58522cf124dd324fbf95d9dd838fac36bcb/bat-pvc-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v6/bat-pvc-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html">FAIL</a> +26 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@xe_vm@bind-execqueues-independent}:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-399-7c58b58522cf124dd324fbf95d9dd838fac36bcb/bat-adlp-7/igt@xe_vm@bind-execqueues-independent.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v6/bat-adlp-7/igt@xe_vm@bind-execqueues-independent.html">FAIL</a> +5 other tests fail</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-399-7c58b58522cf124dd324fbf95d9dd838fac36bcb -&gt; xe-pw-123027v6</li>
</ul>
<p>IGT_7506: 4fdf544bd0a38c5a100ef43c30171827e1c8c442 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-399-7c58b58522cf124dd324fbf95d9dd838fac36bcb: 7c58b58522cf124dd324fbf95d9dd838fac36bcb<br />
  xe-pw-123027v6: 123027v6</p>

</body>
</html>

--===============7056295382927950658==--
