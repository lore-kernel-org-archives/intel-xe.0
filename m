Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBF64C27C6E
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jun 2024 14:28:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9900010E089;
	Fri, 14 Jun 2024 14:28:42 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CB9410E089;
 Fri, 14 Jun 2024 14:28:38 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5825140247790844772=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_drm/=7Bttm=2Cxe=7D=3A_Improve_tt?=
 =?utf-8?q?m=5Fbo=5Fvmap=28=29_and_update_xe?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Thomas Zimmermann" <tzimmermann@suse.de>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 14 Jun 2024 14:28:38 -0000
Message-ID: <171837531844.77190.17341734367700859921@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240614133556.11378-1-tzimmermann@suse.de>
In-Reply-To: <20240614133556.11378-1-tzimmermann@suse.de>
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

--===============5825140247790844772==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/{ttm,xe}: Improve ttm_bo_vmap() and update xe
URL   : https://patchwork.freedesktop.org/series/134890/
State : failure

== Summary ==

CI Bug Log - changes from xe-1470-00e9498b453447a5afe527bd0e174587b12f66d2_BAT -> xe-pw-134890v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-134890v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-134890v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-134890v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:
    - bat-atsm-2:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1470-00e9498b453447a5afe527bd0e174587b12f66d2/bat-atsm-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134890v1/bat-atsm-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html

  * igt@xe_exec_compute_mode@twice-userptr-invalidate:
    - bat-atsm-2:         [PASS][3] -> [DMESG-WARN][4] +149 other tests dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1470-00e9498b453447a5afe527bd0e174587b12f66d2/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134890v1/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html

  * igt@xe_intel_bb@create-in-region:
    - bat-dg2-oem2:       [PASS][5] -> [DMESG-WARN][6] +211 other tests dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1470-00e9498b453447a5afe527bd0e174587b12f66d2/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134890v1/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html

  * igt@xe_intel_bb@intel-bb-blit-y:
    - bat-pvc-2:          [PASS][7] -> [DMESG-WARN][8] +160 other tests dmesg-warn
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1470-00e9498b453447a5afe527bd0e174587b12f66d2/bat-pvc-2/igt@xe_intel_bb@intel-bb-blit-y.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134890v1/bat-pvc-2/igt@xe_intel_bb@intel-bb-blit-y.html

  * igt@xe_intel_bb@offset-control:
    - bat-adlp-7:         [PASS][9] -> [DMESG-WARN][10] +170 other tests dmesg-warn
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1470-00e9498b453447a5afe527bd0e174587b12f66d2/bat-adlp-7/igt@xe_intel_bb@offset-control.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134890v1/bat-adlp-7/igt@xe_intel_bb@offset-control.html

  * igt@xe_live_ktest@xe_migrate:
    - bat-pvc-2:          [PASS][11] -> [SKIP][12] +2 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1470-00e9498b453447a5afe527bd0e174587b12f66d2/bat-pvc-2/igt@xe_live_ktest@xe_migrate.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134890v1/bat-pvc-2/igt@xe_live_ktest@xe_migrate.html
    - bat-atsm-2:         [PASS][13] -> [SKIP][14] +2 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1470-00e9498b453447a5afe527bd0e174587b12f66d2/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134890v1/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-pvc-2:          [PASS][15] -> [INCOMPLETE][16] +1 other test incomplete
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1470-00e9498b453447a5afe527bd0e174587b12f66d2/bat-pvc-2/igt@xe_pat@pat-index-xehpc.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134890v1/bat-pvc-2/igt@xe_pat@pat-index-xehpc.html

  
#### Warnings ####

  * igt@xe_evict@evict-beng-small-external:
    - bat-pvc-2:          [FAIL][17] ([Intel XE#1000]) -> [DMESG-FAIL][18] +3 other tests dmesg-fail
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1470-00e9498b453447a5afe527bd0e174587b12f66d2/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134890v1/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-c-edp-1:
    - {bat-lnl-1}:        [PASS][19] -> [DMESG-WARN][20] +199 other tests dmesg-warn
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1470-00e9498b453447a5afe527bd0e174587b12f66d2/bat-lnl-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-c-edp-1.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134890v1/bat-lnl-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-c-edp-1.html

  * {igt@xe_intel_bb@render@render-ymajor-512}:
    - bat-adlp-7:         [PASS][21] -> [DMESG-WARN][22] +1 other test dmesg-warn
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1470-00e9498b453447a5afe527bd0e174587b12f66d2/bat-adlp-7/igt@xe_intel_bb@render@render-ymajor-512.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134890v1/bat-adlp-7/igt@xe_intel_bb@render@render-ymajor-512.html

  
Known issues
------------

  Here are the changes found in xe-pw-134890v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:
    - bat-dg2-oem2:       [PASS][23] -> [INCOMPLETE][24] ([Intel XE#392])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1470-00e9498b453447a5afe527bd0e174587b12f66d2/bat-dg2-oem2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134890v1/bat-dg2-oem2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html
    - bat-pvc-2:          [PASS][25] -> [INCOMPLETE][26] ([Intel XE#392])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1470-00e9498b453447a5afe527bd0e174587b12f66d2/bat-pvc-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134890v1/bat-pvc-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html

  * igt@xe_live_ktest@xe_migrate:
    - bat-adlp-7:         [PASS][27] -> [SKIP][28] ([Intel XE#1192]) +2 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1470-00e9498b453447a5afe527bd0e174587b12f66d2/bat-adlp-7/igt@xe_live_ktest@xe_migrate.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134890v1/bat-adlp-7/igt@xe_live_ktest@xe_migrate.html
    - bat-dg2-oem2:       [PASS][29] -> [SKIP][30] ([Intel XE#1192]) +2 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1470-00e9498b453447a5afe527bd0e174587b12f66d2/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134890v1/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392


Build changes
-------------

  * IGT: IGT_7888 -> IGT_7889
  * Linux: xe-1470-00e9498b453447a5afe527bd0e174587b12f66d2 -> xe-pw-134890v1

  IGT_7888: 021538d059575eb9f93d36fea36015cd3f9fca7d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7889: 9dca15da37f2a385b04427eb39cd460224d09c25 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1470-00e9498b453447a5afe527bd0e174587b12f66d2: 00e9498b453447a5afe527bd0e174587b12f66d2
  xe-pw-134890v1: 134890v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134890v1/index.html

--===============5825140247790844772==
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
<tr><td><b>Series:</b></td><td>drm/{ttm,xe}: Improve ttm_bo_vmap() and update xe</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/134890/">https://patchwork.freedesktop.org/series/134890/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134890v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134890v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1470-00e9498b453447a5afe527bd0e174587b12f66d2_BAT -&gt; xe-pw-134890v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-134890v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-134890v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-134890v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1470-00e9498b453447a5afe527bd0e174587b12f66d2/bat-atsm-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134890v1/bat-atsm-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-userptr-invalidate:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1470-00e9498b453447a5afe527bd0e174587b12f66d2/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134890v1/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html">DMESG-WARN</a> +149 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@create-in-region:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1470-00e9498b453447a5afe527bd0e174587b12f66d2/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134890v1/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html">DMESG-WARN</a> +211 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@intel-bb-blit-y:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1470-00e9498b453447a5afe527bd0e174587b12f66d2/bat-pvc-2/igt@xe_intel_bb@intel-bb-blit-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134890v1/bat-pvc-2/igt@xe_intel_bb@intel-bb-blit-y.html">DMESG-WARN</a> +160 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@offset-control:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1470-00e9498b453447a5afe527bd0e174587b12f66d2/bat-adlp-7/igt@xe_intel_bb@offset-control.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134890v1/bat-adlp-7/igt@xe_intel_bb@offset-control.html">DMESG-WARN</a> +170 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1470-00e9498b453447a5afe527bd0e174587b12f66d2/bat-pvc-2/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134890v1/bat-pvc-2/igt@xe_live_ktest@xe_migrate.html">SKIP</a> +2 other tests skip</li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1470-00e9498b453447a5afe527bd0e174587b12f66d2/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134890v1/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1470-00e9498b453447a5afe527bd0e174587b12f66d2/bat-pvc-2/igt@xe_pat@pat-index-xehpc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134890v1/bat-pvc-2/igt@xe_pat@pat-index-xehpc.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_evict@evict-beng-small-external:<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1470-00e9498b453447a5afe527bd0e174587b12f66d2/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134890v1/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html">DMESG-FAIL</a> +3 other tests dmesg-fail</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-c-edp-1:</p>
<ul>
<li>{bat-lnl-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1470-00e9498b453447a5afe527bd0e174587b12f66d2/bat-lnl-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-c-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134890v1/bat-lnl-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-c-edp-1.html">DMESG-WARN</a> +199 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>{igt@xe_intel_bb@render@render-ymajor-512}:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1470-00e9498b453447a5afe527bd0e174587b12f66d2/bat-adlp-7/igt@xe_intel_bb@render@render-ymajor-512.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134890v1/bat-adlp-7/igt@xe_intel_bb@render@render-ymajor-512.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-134890v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1470-00e9498b453447a5afe527bd0e174587b12f66d2/bat-dg2-oem2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134890v1/bat-dg2-oem2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1470-00e9498b453447a5afe527bd0e174587b12f66d2/bat-pvc-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134890v1/bat-pvc-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1470-00e9498b453447a5afe527bd0e174587b12f66d2/bat-adlp-7/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134890v1/bat-adlp-7/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +2 other tests skip</li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1470-00e9498b453447a5afe527bd0e174587b12f66d2/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134890v1/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7888 -&gt; IGT_7889</li>
<li>Linux: xe-1470-00e9498b453447a5afe527bd0e174587b12f66d2 -&gt; xe-pw-134890v1</li>
</ul>
<p>IGT_7888: 021538d059575eb9f93d36fea36015cd3f9fca7d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7889: 9dca15da37f2a385b04427eb39cd460224d09c25 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1470-00e9498b453447a5afe527bd0e174587b12f66d2: 00e9498b453447a5afe527bd0e174587b12f66d2<br />
  xe-pw-134890v1: 134890v1</p>

</body>
</html>

--===============5825140247790844772==--
