Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF1DAE77188
	for <intel-xe@archiver.kernel.org>; Mon,  6 Jan 2025 19:13:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B30910E9CC;
	Mon,  6 Jan 2025 19:13:15 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 986EA10E9CC;
 Mon,  6 Jan 2025 19:13:14 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3179306609516548970=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Revert_=22vmstat=3A_disable?=
 =?utf-8?q?_vmstat=5Fwork_on_vmstat=5Fcpu=5Fdown=5Fprep=28=29=22?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 06 Jan 2025 19:13:14 -0000
Message-ID: <173619079461.390563.13635074917083025063@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250106172455.1184656-1-lucas.demarchi@intel.com>
In-Reply-To: <20250106172455.1184656-1-lucas.demarchi@intel.com>
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

--===============3179306609516548970==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Revert "vmstat: disable vmstat_work on vmstat_cpu_down_prep()"
URL   : https://patchwork.freedesktop.org/series/143161/
State : success

== Summary ==

CI Bug Log - changes from xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a_BAT -> xe-pw-143161v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): bat-adlp-vm 

Known issues
------------

  Here are the changes found in xe-pw-143161v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_basic@twice-bindexecqueue-rebind:
    - bat-adlp-vf:        [PASS][1] -> [DMESG-FAIL][2] ([Intel XE#3868])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143161v1/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-rebind.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - bat-bmg-2:          NOTRUN -> [SKIP][3] ([Intel XE#2229])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143161v1/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
    - bat-bmg-1:          NOTRUN -> [SKIP][4] ([Intel XE#2229])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143161v1/bat-bmg-1/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][5] ([Intel XE#2229])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143161v1/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
    - bat-atsm-2:         NOTRUN -> [SKIP][6] ([Intel XE#2229])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143161v1/bat-atsm-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
    - bat-pvc-2:          NOTRUN -> [SKIP][7] ([Intel XE#2229]) +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143161v1/bat-pvc-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_vm@shared-pde2-page:
    - bat-adlp-vf:        [PASS][8] -> [DMESG-WARN][9] ([Intel XE#3970])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/bat-adlp-vf/igt@xe_vm@shared-pde2-page.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143161v1/bat-adlp-vf/igt@xe_vm@shared-pde2-page.html

  
#### Possible fixes ####

  * igt@xe_live_ktest@xe_bo:
    - bat-pvc-2:          [SKIP][10] ([Intel XE#1192]) -> [PASS][11] +2 other tests pass
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/bat-pvc-2/igt@xe_live_ktest@xe_bo.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143161v1/bat-pvc-2/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_dma_buf:
    - bat-bmg-2:          [SKIP][12] ([Intel XE#1192]) -> [PASS][13] +2 other tests pass
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143161v1/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html

  * igt@xe_live_ktest@xe_migrate:
    - bat-bmg-1:          [SKIP][14] ([Intel XE#1192]) -> [PASS][15] +2 other tests pass
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143161v1/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html
    - bat-dg2-oem2:       [SKIP][16] ([Intel XE#1192]) -> [PASS][17] +2 other tests pass
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143161v1/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html
    - bat-atsm-2:         [SKIP][18] ([Intel XE#1192]) -> [PASS][19] +2 other tests pass
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143161v1/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html

  
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#3868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970


Build changes
-------------

  * IGT: IGT_8174 -> IGT_8175
  * Linux: xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a -> xe-pw-143161v1

  IGT_8174: d2004b0623dbccd08502525849b4eef881aa199e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8175: c982ba23a3a3cfda0abe57e18ab16f719ef5de79 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a: 1c0bba8188ab903248bafdfd0ae42d8e43adaf4a
  xe-pw-143161v1: 143161v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143161v1/index.html

--===============3179306609516548970==
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
<tr><td><b>Series:</b></td><td>Revert &quot;vmstat: disable vmstat_work on vmstat_cpu_down_prep()&quot;</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/143161/">https://patchwork.freedesktop.org/series/143161/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143161v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143161v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a_BAT -&gt; xe-pw-143161v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-143161v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-rebind:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143161v1/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-rebind.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868">Intel XE#3868</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143161v1/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143161v1/bat-bmg-1/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143161v1/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143161v1/bat-atsm-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143161v1/bat-pvc-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_vm@shared-pde2-page:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/bat-adlp-vf/igt@xe_vm@shared-pde2-page.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143161v1/bat-adlp-vf/igt@xe_vm@shared-pde2-page.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/bat-pvc-2/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143161v1/bat-pvc-2/igt@xe_live_ktest@xe_bo.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143161v1/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143161v1/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html">PASS</a> +2 other tests pass</li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143161v1/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html">PASS</a> +2 other tests pass</li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143161v1/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8174 -&gt; IGT_8175</li>
<li>Linux: xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a -&gt; xe-pw-143161v1</li>
</ul>
<p>IGT_8174: d2004b0623dbccd08502525849b4eef881aa199e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8175: c982ba23a3a3cfda0abe57e18ab16f719ef5de79 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2441-1c0bba8188ab903248bafdfd0ae42d8e43adaf4a: 1c0bba8188ab903248bafdfd0ae42d8e43adaf4a<br />
  xe-pw-143161v1: 143161v1</p>

</body>
</html>

--===============3179306609516548970==--
