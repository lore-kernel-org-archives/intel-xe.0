Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E06CC4332F
	for <intel-xe@archiver.kernel.org>; Tue, 31 Oct 2023 16:56:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C83F10E501;
	Tue, 31 Oct 2023 16:56:23 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2170610E5A6;
 Tue, 31 Oct 2023 16:56:20 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 09A9EA0003;
 Tue, 31 Oct 2023 16:56:20 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2580980257532092453=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Tue, 31 Oct 2023 16:56:20 -0000
Message-ID: <169877138000.27664.5211369762690662413@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231031142133.17129-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20231031142133.17129-1-thomas.hellstrom@linux.intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_series_st?=
 =?utf-8?q?arting_with_=5BCI=2C01/11=5D_drm/gpuvm=3A_convert_WARN=28=29_to?=
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

--===============2580980257532092453==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [CI,01/11] drm/gpuvm: convert WARN() to drm_WARN() variants
URL   : https://patchwork.freedesktop.org/series/125814/
State : failure

== Summary ==

CI Bug Log - changes from xe-458-87f169fc90d74a88df33e0b34c02240308625a99_BAT -> xe-pw-125814v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-125814v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-125814v1_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-125814v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-atsm-2:         [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-458-87f169fc90d74a88df33e0b34c02240308625a99/bat-atsm-2/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125814v1/bat-atsm-2/igt@core_hotunplug@unbind-rebind.html
    - bat-adlp-7:         [PASS][3] -> [DMESG-WARN][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-458-87f169fc90d74a88df33e0b34c02240308625a99/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125814v1/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html
    - bat-dg2-oem2:       [PASS][5] -> [ABORT][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-458-87f169fc90d74a88df33e0b34c02240308625a99/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125814v1/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html

  * igt@xe_exec_balancer@no-exec-parallel-basic:
    - bat-pvc-2:          NOTRUN -> [DMESG-WARN][7] +2 other tests dmesg-warn
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125814v1/bat-pvc-2/igt@xe_exec_balancer@no-exec-parallel-basic.html

  * igt@xe_exec_balancer@twice-cm-virtual-rebind:
    - bat-pvc-2:          NOTRUN -> [DMESG-FAIL][8] +1 other test dmesg-fail
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125814v1/bat-pvc-2/igt@xe_exec_balancer@twice-cm-virtual-rebind.html

  * igt@xe_exec_balancer@twice-cm-virtual-userptr-rebind:
    - bat-pvc-2:          NOTRUN -> [FAIL][9] +2 other tests fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125814v1/bat-pvc-2/igt@xe_exec_balancer@twice-cm-virtual-userptr-rebind.html

  * igt@xe_exec_basic@no-exec-basic:
    - bat-pvc-2:          NOTRUN -> [INCOMPLETE][10]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125814v1/bat-pvc-2/igt@xe_exec_basic@no-exec-basic.html

  
#### Warnings ####

  * igt@xe_evict@evict-small-cm:
    - bat-pvc-2:          [DMESG-FAIL][11] ([Intel XE#482]) -> [FAIL][12] +1 other test fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-458-87f169fc90d74a88df33e0b34c02240308625a99/bat-pvc-2/igt@xe_evict@evict-small-cm.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125814v1/bat-pvc-2/igt@xe_evict@evict-small-cm.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@xe_exec_basic@twice-bindexecqueue}:
    - bat-pvc-2:          NOTRUN -> [INCOMPLETE][13]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125814v1/bat-pvc-2/igt@xe_exec_basic@twice-bindexecqueue.html

  
Known issues
------------

  Here are the changes found in xe-pw-125814v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:
    - bat-dg2-oem2:       [PASS][14] -> [FAIL][15] ([i915#2346])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-458-87f169fc90d74a88df33e0b34c02240308625a99/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125814v1/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@d-dp3:
    - bat-dg2-oem2:       [PASS][16] -> [FAIL][17] ([Intel XE#480])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-458-87f169fc90d74a88df33e0b34c02240308625a99/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@d-dp3.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125814v1/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@d-dp3.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:
    - bat-adlp-7:         [PASS][18] -> [FAIL][19] ([Intel XE#480]) +1 other test fail
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-458-87f169fc90d74a88df33e0b34c02240308625a99/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125814v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html

  * igt@xe_exec_balancer@twice-virtual-rebind:
    - bat-pvc-2:          NOTRUN -> [DMESG-FAIL][20] ([Intel XE#696]) +16 other tests dmesg-fail
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125814v1/bat-pvc-2/igt@xe_exec_balancer@twice-virtual-rebind.html

  * igt@xe_exec_fault_mode@twice-userptr:
    - bat-adlp-7:         NOTRUN -> [SKIP][21] ([Intel XE#288]) +17 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125814v1/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr.html

  * igt@xe_live_ktest@bo:
    - bat-adlp-7:         [PASS][22] -> [SKIP][23] ([Intel XE#754]) +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-458-87f169fc90d74a88df33e0b34c02240308625a99/bat-adlp-7/igt@xe_live_ktest@bo.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125814v1/bat-adlp-7/igt@xe_live_ktest@bo.html

  
#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-dp3:
    - bat-dg2-oem2:       [FAIL][24] ([Intel XE#480]) -> [PASS][25]
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-458-87f169fc90d74a88df33e0b34c02240308625a99/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp3.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125814v1/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp3.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:
    - bat-dg2-oem2:       [FAIL][26] ([Intel XE#400] / [Intel XE#616]) -> [PASS][27] +2 other tests pass
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-458-87f169fc90d74a88df33e0b34c02240308625a99/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125814v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html

  * {igt@xe_create@create-execqueues-leak}:
    - bat-atsm-2:         [FAIL][28] ([Intel XE#524]) -> [PASS][29]
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-458-87f169fc90d74a88df33e0b34c02240308625a99/bat-atsm-2/igt@xe_create@create-execqueues-leak.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125814v1/bat-atsm-2/igt@xe_create@create-execqueues-leak.html

  
#### Warnings ####

  * igt@xe_evict@evict-beng-small-cm:
    - bat-pvc-2:          [DMESG-FAIL][30] ([Intel XE#482]) -> [FAIL][31] ([Intel XE#389])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-458-87f169fc90d74a88df33e0b34c02240308625a99/bat-pvc-2/igt@xe_evict@evict-beng-small-cm.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125814v1/bat-pvc-2/igt@xe_evict@evict-beng-small-cm.html

  * igt@xe_live_ktest@migrate:
    - bat-adlp-7:         [INCOMPLETE][32] ([Intel XE#753]) -> [SKIP][33] ([Intel XE#754])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-458-87f169fc90d74a88df33e0b34c02240308625a99/bat-adlp-7/igt@xe_live_ktest@migrate.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125814v1/bat-adlp-7/igt@xe_live_ktest@migrate.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#389]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/389
  [Intel XE#400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/400
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/482
  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#696]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/696
  [Intel XE#753]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/753
  [Intel XE#754]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/754
  [Intel XE#854]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/854
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346


Build changes
-------------

  * Linux: xe-458-87f169fc90d74a88df33e0b34c02240308625a99 -> xe-pw-125814v1

  IGT_7566: 7566
  xe-458-87f169fc90d74a88df33e0b34c02240308625a99: 87f169fc90d74a88df33e0b34c02240308625a99
  xe-pw-125814v1: 125814v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125814v1/index.html

--===============2580980257532092453==
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
<tr><td><b>Series:</b></td><td>series starting with [CI,01/11] drm/gpuvm: convert WARN() to drm_WARN() variants</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/125814/">https://patchwork.freedesktop.org/series/125814/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125814v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125814v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-458-87f169fc90d74a88df33e0b34c02240308625a99_BAT -&gt; xe-pw-125814v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-125814v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-125814v1_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-125814v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>
<p>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-458-87f169fc90d74a88df33e0b34c02240308625a99/bat-atsm-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125814v1/bat-atsm-2/igt@core_hotunplug@unbind-rebind.html">ABORT</a></p>
</li>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-458-87f169fc90d74a88df33e0b34c02240308625a99/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125814v1/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a></p>
</li>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-458-87f169fc90d74a88df33e0b34c02240308625a99/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125814v1/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html">ABORT</a></p>
</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-parallel-basic:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125814v1/bat-pvc-2/igt@xe_exec_balancer@no-exec-parallel-basic.html">DMESG-WARN</a> +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-cm-virtual-rebind:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125814v1/bat-pvc-2/igt@xe_exec_balancer@twice-cm-virtual-rebind.html">DMESG-FAIL</a> +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-cm-virtual-userptr-rebind:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125814v1/bat-pvc-2/igt@xe_exec_balancer@twice-cm-virtual-userptr-rebind.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-basic:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125814v1/bat-pvc-2/igt@xe_exec_basic@no-exec-basic.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_evict@evict-small-cm:<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-458-87f169fc90d74a88df33e0b34c02240308625a99/bat-pvc-2/igt@xe_evict@evict-small-cm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/482">Intel XE#482</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125814v1/bat-pvc-2/igt@xe_evict@evict-small-cm.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@xe_exec_basic@twice-bindexecqueue}:<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125814v1/bat-pvc-2/igt@xe_exec_basic@twice-bindexecqueue.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-125814v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-458-87f169fc90d74a88df33e0b34c02240308625a99/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125814v1/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@d-dp3:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-458-87f169fc90d74a88df33e0b34c02240308625a99/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@d-dp3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125814v1/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@d-dp3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-458-87f169fc90d74a88df33e0b34c02240308625a99/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125814v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-virtual-rebind:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125814v1/bat-pvc-2/igt@xe_exec_balancer@twice-virtual-rebind.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/696">Intel XE#696</a>) +16 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125814v1/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@bo:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-458-87f169fc90d74a88df33e0b34c02240308625a99/bat-adlp-7/igt@xe_live_ktest@bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125814v1/bat-adlp-7/igt@xe_live_ktest@bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/754">Intel XE#754</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-dp3:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-458-87f169fc90d74a88df33e0b34c02240308625a99/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125814v1/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-458-87f169fc90d74a88df33e0b34c02240308625a99/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/400">Intel XE#400</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125814v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>{igt@xe_create@create-execqueues-leak}:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-458-87f169fc90d74a88df33e0b34c02240308625a99/bat-atsm-2/igt@xe_create@create-execqueues-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/524">Intel XE#524</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125814v1/bat-atsm-2/igt@xe_create@create-execqueues-leak.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@xe_evict@evict-beng-small-cm:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-458-87f169fc90d74a88df33e0b34c02240308625a99/bat-pvc-2/igt@xe_evict@evict-beng-small-cm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/482">Intel XE#482</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125814v1/bat-pvc-2/igt@xe_evict@evict-beng-small-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/389">Intel XE#389</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@migrate:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-458-87f169fc90d74a88df33e0b34c02240308625a99/bat-adlp-7/igt@xe_live_ktest@migrate.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/753">Intel XE#753</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125814v1/bat-adlp-7/igt@xe_live_ktest@migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/754">Intel XE#754</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-458-87f169fc90d74a88df33e0b34c02240308625a99 -&gt; xe-pw-125814v1</li>
</ul>
<p>IGT_7566: 7566<br />
  xe-458-87f169fc90d74a88df33e0b34c02240308625a99: 87f169fc90d74a88df33e0b34c02240308625a99<br />
  xe-pw-125814v1: 125814v1</p>

</body>
</html>

--===============2580980257532092453==--
