Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A1AFC021A4
	for <intel-xe@archiver.kernel.org>; Mon, 24 Feb 2025 16:03:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC33E10E448;
	Mon, 24 Feb 2025 16:02:59 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F73810E42F;
 Mon, 24 Feb 2025 16:02:58 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7575112662235293459=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_Fix_VFs_resume_errors?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 24 Feb 2025 16:02:58 -0000
Message-ID: <174041297864.1648889.10114364896105232292@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250224064745.1778-1-satyanarayana.k.v.p@intel.com>
In-Reply-To: <20250224064745.1778-1-satyanarayana.k.v.p@intel.com>
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

--===============7575112662235293459==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fix VFs resume errors
URL   : https://patchwork.freedesktop.org/series/145295/
State : failure

== Summary ==

CI Bug Log - changes from xe-2700-f2a2bd676bde0942c9dfe5c55d54eec298260f88_BAT -> xe-pw-145295v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-145295v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-145295v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): bat-adlp-vm 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-145295v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@fbdev@eof:
    - bat-pvc-2:          [PASS][1] -> [SKIP][2] +4 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2700-f2a2bd676bde0942c9dfe5c55d54eec298260f88/bat-pvc-2/igt@fbdev@eof.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145295v1/bat-pvc-2/igt@fbdev@eof.html

  * igt@fbdev@info:
    - bat-atsm-2:         [PASS][3] -> [SKIP][4] +4 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2700-f2a2bd676bde0942c9dfe5c55d54eec298260f88/bat-atsm-2/igt@fbdev@info.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145295v1/bat-atsm-2/igt@fbdev@info.html

  
New tests
---------

  New tests have been introduced between xe-2700-f2a2bd676bde0942c9dfe5c55d54eec298260f88_BAT and xe-pw-145295v1_BAT:

### New IGT tests (1) ###

  * igt@xe_exec_queue_property@invalid-property:
    - Statuses : 8 pass(s)
    - Exec time: [0.00, 0.01] s

  

Known issues
------------

  Here are the changes found in xe-pw-145295v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - bat-lnl-2:          NOTRUN -> [SKIP][5] ([Intel XE#2229]) +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145295v1/bat-lnl-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - bat-adlp-vf:        NOTRUN -> [SKIP][6] ([Intel XE#2229] / [Intel XE#455]) +1 other test skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145295v1/bat-adlp-vf/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
    - bat-bmg-2:          NOTRUN -> [SKIP][7] ([Intel XE#2229])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145295v1/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
    - bat-bmg-1:          NOTRUN -> [SKIP][8] ([Intel XE#2229])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145295v1/bat-bmg-1/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - bat-adlp-vf:        NOTRUN -> [SKIP][9] ([Intel XE#2229])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145295v1/bat-adlp-vf/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
    - bat-lnl-1:          NOTRUN -> [SKIP][10] ([Intel XE#2229]) +1 other test skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145295v1/bat-lnl-1/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  
#### Possible fixes ####

  * igt@xe_intel_bb@intel-bb-blit-x:
    - bat-adlp-vf:        [DMESG-WARN][11] ([Intel XE#3970]) -> [PASS][12] +1 other test pass
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2700-f2a2bd676bde0942c9dfe5c55d54eec298260f88/bat-adlp-vf/igt@xe_intel_bb@intel-bb-blit-x.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145295v1/bat-adlp-vf/igt@xe_intel_bb@intel-bb-blit-x.html

  * igt@xe_live_ktest@xe_dma_buf:
    - bat-bmg-2:          [SKIP][13] ([Intel XE#4322]) -> [PASS][14] +2 other tests pass
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2700-f2a2bd676bde0942c9dfe5c55d54eec298260f88/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145295v1/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html

  * igt@xe_live_ktest@xe_migrate:
    - bat-bmg-1:          [SKIP][15] ([Intel XE#4322]) -> [PASS][16] +2 other tests pass
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2700-f2a2bd676bde0942c9dfe5c55d54eec298260f88/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145295v1/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html
    - bat-lnl-2:          [SKIP][17] ([Intel XE#4322]) -> [PASS][18] +1 other test pass
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2700-f2a2bd676bde0942c9dfe5c55d54eec298260f88/bat-lnl-2/igt@xe_live_ktest@xe_migrate.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145295v1/bat-lnl-2/igt@xe_live_ktest@xe_migrate.html
    - bat-adlp-vf:        [SKIP][19] ([Intel XE#4322]) -> [PASS][20] +1 other test pass
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2700-f2a2bd676bde0942c9dfe5c55d54eec298260f88/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145295v1/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html
    - bat-lnl-1:          [SKIP][21] ([Intel XE#4322]) -> [PASS][22] +1 other test pass
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2700-f2a2bd676bde0942c9dfe5c55d54eec298260f88/bat-lnl-1/igt@xe_live_ktest@xe_migrate.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145295v1/bat-lnl-1/igt@xe_live_ktest@xe_migrate.html

  
#### Warnings ####

  * igt@xe_live_ktest@xe_bo:
    - bat-adlp-vf:        [SKIP][23] ([Intel XE#4322]) -> [SKIP][24] ([Intel XE#2229] / [Intel XE#455])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2700-f2a2bd676bde0942c9dfe5c55d54eec298260f88/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145295v1/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html
    - bat-lnl-1:          [SKIP][25] ([Intel XE#4322]) -> [SKIP][26] ([Intel XE#2229])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2700-f2a2bd676bde0942c9dfe5c55d54eec298260f88/bat-lnl-1/igt@xe_live_ktest@xe_bo.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145295v1/bat-lnl-1/igt@xe_live_ktest@xe_bo.html
    - bat-lnl-2:          [SKIP][27] ([Intel XE#4322]) -> [SKIP][28] ([Intel XE#2229])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2700-f2a2bd676bde0942c9dfe5c55d54eec298260f88/bat-lnl-2/igt@xe_live_ktest@xe_bo.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145295v1/bat-lnl-2/igt@xe_live_ktest@xe_bo.html

  
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970
  [Intel XE#4322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4322
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455


Build changes
-------------

  * Linux: xe-2700-f2a2bd676bde0942c9dfe5c55d54eec298260f88 -> xe-pw-145295v1

  IGT_8246: 2670886863d5821273146d7f94cdd3c8e3a4fe0b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2700-f2a2bd676bde0942c9dfe5c55d54eec298260f88: f2a2bd676bde0942c9dfe5c55d54eec298260f88
  xe-pw-145295v1: 145295v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145295v1/index.html

--===============7575112662235293459==
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
<tr><td><b>Series:</b></td><td>Fix VFs resume errors</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/145295/">https://patchwork.freedesktop.org/series/145295/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145295v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145295v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2700-f2a2bd676bde0942c9dfe5c55d54eec298260f88_BAT -&gt; xe-pw-145295v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-145295v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-145295v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-145295v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2700-f2a2bd676bde0942c9dfe5c55d54eec298260f88/bat-pvc-2/igt@fbdev@eof.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145295v1/bat-pvc-2/igt@fbdev@eof.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2700-f2a2bd676bde0942c9dfe5c55d54eec298260f88/bat-atsm-2/igt@fbdev@info.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145295v1/bat-atsm-2/igt@fbdev@info.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-2700-f2a2bd676bde0942c9dfe5c55d54eec298260f88_BAT and xe-pw-145295v1_BAT:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@xe_exec_queue_property@invalid-property:<ul>
<li>Statuses : 8 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-145295v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:</p>
<ul>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145295v1/bat-lnl-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145295v1/bat-adlp-vf/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145295v1/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145295v1/bat-bmg-1/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145295v1/bat-adlp-vf/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145295v1/bat-lnl-1/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@xe_intel_bb@intel-bb-blit-x:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2700-f2a2bd676bde0942c9dfe5c55d54eec298260f88/bat-adlp-vf/igt@xe_intel_bb@intel-bb-blit-x.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145295v1/bat-adlp-vf/igt@xe_intel_bb@intel-bb-blit-x.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2700-f2a2bd676bde0942c9dfe5c55d54eec298260f88/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4322">Intel XE#4322</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145295v1/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2700-f2a2bd676bde0942c9dfe5c55d54eec298260f88/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4322">Intel XE#4322</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145295v1/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html">PASS</a> +2 other tests pass</li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2700-f2a2bd676bde0942c9dfe5c55d54eec298260f88/bat-lnl-2/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4322">Intel XE#4322</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145295v1/bat-lnl-2/igt@xe_live_ktest@xe_migrate.html">PASS</a> +1 other test pass</li>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2700-f2a2bd676bde0942c9dfe5c55d54eec298260f88/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4322">Intel XE#4322</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145295v1/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html">PASS</a> +1 other test pass</li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2700-f2a2bd676bde0942c9dfe5c55d54eec298260f88/bat-lnl-1/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4322">Intel XE#4322</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145295v1/bat-lnl-1/igt@xe_live_ktest@xe_migrate.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_live_ktest@xe_bo:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2700-f2a2bd676bde0942c9dfe5c55d54eec298260f88/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4322">Intel XE#4322</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145295v1/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2700-f2a2bd676bde0942c9dfe5c55d54eec298260f88/bat-lnl-1/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4322">Intel XE#4322</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145295v1/bat-lnl-1/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2700-f2a2bd676bde0942c9dfe5c55d54eec298260f88/bat-lnl-2/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4322">Intel XE#4322</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145295v1/bat-lnl-2/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2700-f2a2bd676bde0942c9dfe5c55d54eec298260f88 -&gt; xe-pw-145295v1</li>
</ul>
<p>IGT_8246: 2670886863d5821273146d7f94cdd3c8e3a4fe0b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2700-f2a2bd676bde0942c9dfe5c55d54eec298260f88: f2a2bd676bde0942c9dfe5c55d54eec298260f88<br />
  xe-pw-145295v1: 145295v1</p>

</body>
</html>

--===============7575112662235293459==--
