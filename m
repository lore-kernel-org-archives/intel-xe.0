Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E61D7CD128A
	for <intel-xe@archiver.kernel.org>; Mon,  1 Apr 2024 18:07:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9071010E8C8;
	Mon,  1 Apr 2024 18:07:51 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8566F10E8C8;
 Mon,  1 Apr 2024 18:07:50 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6913047372161009350=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/xe2=3A_Add_workaround_180?=
 =?utf-8?q?33852989_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 01 Apr 2024 18:07:50 -0000
Message-ID: <171199487053.1135732.17844246980782187420@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240401163806.3821128-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240401163806.3821128-1-himal.prasad.ghimiray@intel.com>
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

--===============6913047372161009350==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/xe2: Add workaround 18033852989 (rev3)
URL   : https://patchwork.freedesktop.org/series/131881/
State : success

== Summary ==

CI Bug Log - changes from xe-1021-a585b19932157f2c96293bf00288968ada86d435_BAT -> xe-pw-131881v3_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-131881v3_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:
    - bat-adlp-7:         NOTRUN -> [SKIP][1] ([Intel XE#288]) +22 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131881v3/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html

  
#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-adlp-7:         [INCOMPLETE][2] ([Intel XE#1458]) -> [PASS][3]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1021-a585b19932157f2c96293bf00288968ada86d435/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131881v3/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_psr@psr-cursor-plane-move:
    - bat-adlp-7:         [SKIP][4] ([Intel XE#1177]) -> [PASS][5] +54 other tests pass
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1021-a585b19932157f2c96293bf00288968ada86d435/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131881v3/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html

  * igt@xe_intel_bb@offset-control:
    - bat-adlp-7:         [SKIP][6] ([Intel XE#1457]) -> [PASS][7] +131 other tests pass
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1021-a585b19932157f2c96293bf00288968ada86d435/bat-adlp-7/igt@xe_intel_bb@offset-control.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131881v3/bat-adlp-7/igt@xe_intel_bb@offset-control.html

  * igt@xe_module_load@load:
    - bat-adlp-7:         [SKIP][8] ([Intel XE#378]) -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1021-a585b19932157f2c96293bf00288968ada86d435/bat-adlp-7/igt@xe_module_load@load.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131881v3/bat-adlp-7/igt@xe_module_load@load.html

  
#### Warnings ####

  * igt@kms_dsc@dsc-basic:
    - bat-adlp-7:         [SKIP][10] ([Intel XE#1177]) -> [SKIP][11] ([Intel XE#455])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1021-a585b19932157f2c96293bf00288968ada86d435/bat-adlp-7/igt@kms_dsc@dsc-basic.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131881v3/bat-adlp-7/igt@kms_dsc@dsc-basic.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [SKIP][12] ([Intel XE#1177]) -> [FAIL][13] ([Intel XE#616])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1021-a585b19932157f2c96293bf00288968ada86d435/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131881v3/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  * igt@xe_evict_ccs@evict-overcommit-simple:
    - bat-adlp-7:         [SKIP][14] ([Intel XE#1457]) -> [SKIP][15] ([Intel XE#688]) +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1021-a585b19932157f2c96293bf00288968ada86d435/bat-adlp-7/igt@xe_evict_ccs@evict-overcommit-simple.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131881v3/bat-adlp-7/igt@xe_evict_ccs@evict-overcommit-simple.html

  * igt@xe_mmap@vram:
    - bat-adlp-7:         [SKIP][16] ([Intel XE#1457]) -> [SKIP][17] ([Intel XE#1008])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1021-a585b19932157f2c96293bf00288968ada86d435/bat-adlp-7/igt@xe_mmap@vram.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131881v3/bat-adlp-7/igt@xe_mmap@vram.html

  * igt@xe_pat@pat-index-xe2:
    - bat-adlp-7:         [SKIP][18] ([Intel XE#1457]) -> [SKIP][19] ([Intel XE#977])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1021-a585b19932157f2c96293bf00288968ada86d435/bat-adlp-7/igt@xe_pat@pat-index-xe2.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131881v3/bat-adlp-7/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-adlp-7:         [SKIP][20] ([Intel XE#1457]) -> [SKIP][21] ([Intel XE#979]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1021-a585b19932157f2c96293bf00288968ada86d435/bat-adlp-7/igt@xe_pat@pat-index-xehpc.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131881v3/bat-adlp-7/igt@xe_pat@pat-index-xehpc.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1008]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008
  [Intel XE#1177]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1177
  [Intel XE#1416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416
  [Intel XE#1457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1457
  [Intel XE#1458]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1458
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * IGT: IGT_7792 -> IGT_7793
  * Linux: xe-1021-a585b19932157f2c96293bf00288968ada86d435 -> xe-pw-131881v3

  IGT_7792: 80ee6c6247595a92389a56d26d4905ee74e33c7c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7793: d6485199d0e6400dc357e3c1da9df45e8188713c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1021-a585b19932157f2c96293bf00288968ada86d435: a585b19932157f2c96293bf00288968ada86d435
  xe-pw-131881v3: 131881v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131881v3/index.html

--===============6913047372161009350==
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
<tr><td><b>Series:</b></td><td>drm/xe/xe2: Add workaround 18033852989 (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131881/">https://patchwork.freedesktop.org/series/131881/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131881v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131881v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1021-a585b19932157f2c96293bf00288968ada86d435_BAT -&gt; xe-pw-131881v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-131881v3_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131881v3/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +22 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1021-a585b19932157f2c96293bf00288968ada86d435/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1458">Intel XE#1458</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131881v3/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1021-a585b19932157f2c96293bf00288968ada86d435/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1177">Intel XE#1177</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131881v3/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html">PASS</a> +54 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@offset-control:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1021-a585b19932157f2c96293bf00288968ada86d435/bat-adlp-7/igt@xe_intel_bb@offset-control.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1457">Intel XE#1457</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131881v3/bat-adlp-7/igt@xe_intel_bb@offset-control.html">PASS</a> +131 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1021-a585b19932157f2c96293bf00288968ada86d435/bat-adlp-7/igt@xe_module_load@load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131881v3/bat-adlp-7/igt@xe_module_load@load.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1021-a585b19932157f2c96293bf00288968ada86d435/bat-adlp-7/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1177">Intel XE#1177</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131881v3/bat-adlp-7/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1021-a585b19932157f2c96293bf00288968ada86d435/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1177">Intel XE#1177</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131881v3/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-simple:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1021-a585b19932157f2c96293bf00288968ada86d435/bat-adlp-7/igt@xe_evict_ccs@evict-overcommit-simple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1457">Intel XE#1457</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131881v3/bat-adlp-7/igt@xe_evict_ccs@evict-overcommit-simple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1021-a585b19932157f2c96293bf00288968ada86d435/bat-adlp-7/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1457">Intel XE#1457</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131881v3/bat-adlp-7/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008">Intel XE#1008</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1021-a585b19932157f2c96293bf00288968ada86d435/bat-adlp-7/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1457">Intel XE#1457</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131881v3/bat-adlp-7/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1021-a585b19932157f2c96293bf00288968ada86d435/bat-adlp-7/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1457">Intel XE#1457</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131881v3/bat-adlp-7/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7792 -&gt; IGT_7793</li>
<li>Linux: xe-1021-a585b19932157f2c96293bf00288968ada86d435 -&gt; xe-pw-131881v3</li>
</ul>
<p>IGT_7792: 80ee6c6247595a92389a56d26d4905ee74e33c7c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7793: d6485199d0e6400dc357e3c1da9df45e8188713c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1021-a585b19932157f2c96293bf00288968ada86d435: a585b19932157f2c96293bf00288968ada86d435<br />
  xe-pw-131881v3: 131881v3</p>

</body>
</html>

--===============6913047372161009350==--
