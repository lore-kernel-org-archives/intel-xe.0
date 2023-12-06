Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A88EC10F05
	for <intel-xe@archiver.kernel.org>; Wed,  6 Dec 2023 15:00:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B16010E746;
	Wed,  6 Dec 2023 15:00:06 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id EDE0310E746;
 Wed,  6 Dec 2023 15:00:03 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id D2C8FAA917;
 Wed,  6 Dec 2023 15:00:03 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8289766829507516856=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Wed, 06 Dec 2023 15:00:03 -0000
Message-ID: <170187480382.26426.11816486571397979876@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231206125818.4164-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20231206125818.4164-1-thomas.hellstrom@linux.intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_series_st?=
 =?utf-8?q?arting_with_=5BCI=2C01/17=5D_drm/gpuvm=3A_convert_WARN=28=29_to?=
 =?utf-8?q?_drm=5FWARN=28=29_variants?=
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

--===============8289766829507516856==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [CI,01/17] drm/gpuvm: convert WARN() to drm_WARN() variants
URL   : https://patchwork.freedesktop.org/series/127431/
State : failure

== Summary ==

CI Bug Log - changes from xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a_BAT -> xe-pw-127431v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-127431v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-127431v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-127431v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-adlp-7:         [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127431v1/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html
    - bat-dg2-oem2:       [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127431v1/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html
    - bat-atsm-2:         [PASS][5] -> [ABORT][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a/bat-atsm-2/igt@core_hotunplug@unbind-rebind.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127431v1/bat-atsm-2/igt@core_hotunplug@unbind-rebind.html

  * igt@xe_live_ktest@bo:
    - bat-adlp-7:         [PASS][7] -> [SKIP][8] +2 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a/bat-adlp-7/igt@xe_live_ktest@bo.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127431v1/bat-adlp-7/igt@xe_live_ktest@bo.html

  
Known issues
------------

  Here are the changes found in xe-pw-127431v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:
    - bat-adlp-7:         [PASS][9] -> [FAIL][10] ([Intel XE#480])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127431v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html

  
#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1:
    - bat-adlp-7:         [FAIL][11] ([Intel XE#480]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127431v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:
    - bat-dg2-oem2:       [FAIL][13] ([Intel XE#400] / [Intel XE#616]) -> [PASS][14] +2 other tests pass
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127431v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html

  
#### Warnings ####

  * igt@xe_prime_self_import@basic-with_one_bo:
    - bat-atsm-2:         [FAIL][15] -> [FAIL][16] ([Intel XE#999])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a/bat-atsm-2/igt@xe_prime_self_import@basic-with_one_bo.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127431v1/bat-atsm-2/igt@xe_prime_self_import@basic-with_one_bo.html
    - bat-pvc-2:          [FAIL][17] -> [FAIL][18] ([Intel XE#999]) +1 other test fail
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a/bat-pvc-2/igt@xe_prime_self_import@basic-with_one_bo.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127431v1/bat-pvc-2/igt@xe_prime_self_import@basic-with_one_bo.html

  
  [Intel XE#400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/400
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/999


Build changes
-------------

  * IGT: IGT_7622 -> IGT_7624
  * Linux: xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a -> xe-pw-127431v1

  IGT_7622: 48a47d91b7727215b965690c69d84159c8fb1aa2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7624: 4c3f2b9a77ce4a583bf829eb88ed732f6a4fe140 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a: 9d76164e08c68a3d5d081ff7b07c15a2cadf741a
  xe-pw-127431v1: 127431v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127431v1/index.html

--===============8289766829507516856==
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
<tr><td><b>Series:</b></td><td>series starting with [CI,01/17] drm/gpuvm: convert WARN() to drm_WARN() variants</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/127431/">https://patchwork.freedesktop.org/series/127431/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127431v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127431v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a_BAT -&gt; xe-pw-127431v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-127431v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-127431v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-127431v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127431v1/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a></p>
</li>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127431v1/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html">ABORT</a></p>
</li>
<li>
<p>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a/bat-atsm-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127431v1/bat-atsm-2/igt@core_hotunplug@unbind-rebind.html">ABORT</a></p>
</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@bo:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a/bat-adlp-7/igt@xe_live_ktest@bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127431v1/bat-adlp-7/igt@xe_live_ktest@bo.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-127431v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127431v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127431v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/400">Intel XE#400</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127431v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@xe_prime_self_import@basic-with_one_bo:</p>
<ul>
<li>
<p>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a/bat-atsm-2/igt@xe_prime_self_import@basic-with_one_bo.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127431v1/bat-atsm-2/igt@xe_prime_self_import@basic-with_one_bo.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/999">Intel XE#999</a>)</p>
</li>
<li>
<p>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a/bat-pvc-2/igt@xe_prime_self_import@basic-with_one_bo.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127431v1/bat-pvc-2/igt@xe_prime_self_import@basic-with_one_bo.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/999">Intel XE#999</a>) +1 other test fail</p>
</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7622 -&gt; IGT_7624</li>
<li>Linux: xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a -&gt; xe-pw-127431v1</li>
</ul>
<p>IGT_7622: 48a47d91b7727215b965690c69d84159c8fb1aa2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7624: 4c3f2b9a77ce4a583bf829eb88ed732f6a4fe140 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a: 9d76164e08c68a3d5d081ff7b07c15a2cadf741a<br />
  xe-pw-127431v1: 127431v1</p>

</body>
</html>

--===============8289766829507516856==--
