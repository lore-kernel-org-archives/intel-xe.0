Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E73AC4167B
	for <intel-xe@archiver.kernel.org>; Tue,  5 Dec 2023 10:37:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3006210E4CD;
	Tue,  5 Dec 2023 10:37:36 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id A4EE610E4CD;
 Tue,  5 Dec 2023 10:37:34 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 9D741A0078;
 Tue,  5 Dec 2023 10:37:34 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8915136140843714019=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Tue, 05 Dec 2023 10:37:34 -0000
Message-ID: <170177265461.24284.16154956479596196147@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231205094145.116126-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20231205094145.116126-1-thomas.hellstrom@linux.intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_series_st?=
 =?utf-8?q?arting_with_=5BCI=2C01/12=5D_drm/gpuvm=3A_convert_WARN=28=29_to?=
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

--===============8915136140843714019==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [CI,01/12] drm/gpuvm: convert WARN() to drm_WARN() variants
URL   : https://patchwork.freedesktop.org/series/127347/
State : failure

== Summary ==

CI Bug Log - changes from xe-548-2c3aa5d8d87f6026a9fb60d2d78a9f4114722e24_BAT -> xe-pw-127347v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-127347v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-127347v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-127347v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-adlp-7:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-548-2c3aa5d8d87f6026a9fb60d2d78a9f4114722e24/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127347v1/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - bat-dg2-oem2:       [PASS][3] -> [SKIP][4] +1 other test skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-548-2c3aa5d8d87f6026a9fb60d2d78a9f4114722e24/bat-dg2-oem2/igt@kms_pipe_crc_basic@nonblocking-crc.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127347v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@nonblocking-crc.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-dp-3:
    - bat-dg2-oem2:       [PASS][5] -> [FAIL][6] +4 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-548-2c3aa5d8d87f6026a9fb60d2d78a9f4114722e24/bat-dg2-oem2/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-dp-3.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127347v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-dp-3.html

  
#### Warnings ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3:
    - bat-dg2-oem2:       [FAIL][7] ([Intel XE#480]) -> [FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-548-2c3aa5d8d87f6026a9fb60d2d78a9f4114722e24/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127347v1/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3.html

  * igt@xe_evict@evict-beng-small-cm:
    - bat-pvc-2:          [DMESG-FAIL][9] ([Intel XE#482]) -> [FAIL][10] +3 other tests fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-548-2c3aa5d8d87f6026a9fb60d2d78a9f4114722e24/bat-pvc-2/igt@xe_evict@evict-beng-small-cm.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127347v1/bat-pvc-2/igt@xe_evict@evict-beng-small-cm.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@kms_psr@psr_cursor_plane_move}:
    - bat-adlp-7:         [PASS][11] -> [SKIP][12] +2 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-548-2c3aa5d8d87f6026a9fb60d2d78a9f4114722e24/bat-adlp-7/igt@kms_psr@psr_cursor_plane_move.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127347v1/bat-adlp-7/igt@kms_psr@psr_cursor_plane_move.html

  
Known issues
------------

  Here are the changes found in xe-pw-127347v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-dg2-oem2:       [PASS][13] -> [INCOMPLETE][14] ([Intel XE#764])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-548-2c3aa5d8d87f6026a9fb60d2d78a9f4114722e24/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127347v1/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html
    - bat-atsm-2:         [PASS][15] -> [INCOMPLETE][16] ([Intel XE#764])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-548-2c3aa5d8d87f6026a9fb60d2d78a9f4114722e24/bat-atsm-2/igt@core_hotunplug@unbind-rebind.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127347v1/bat-atsm-2/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:
    - bat-adlp-7:         [PASS][17] -> [FAIL][18] ([i915#2346])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-548-2c3aa5d8d87f6026a9fb60d2d78a9f4114722e24/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127347v1/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-adlp-7:         [PASS][19] -> [FAIL][20] ([Intel XE#480]) +1 other test fail
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-548-2c3aa5d8d87f6026a9fb60d2d78a9f4114722e24/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127347v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@d-dp3:
    - bat-dg2-oem2:       [PASS][21] -> [FAIL][22] ([Intel XE#906])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-548-2c3aa5d8d87f6026a9fb60d2d78a9f4114722e24/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@d-dp3.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127347v1/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@d-dp3.html

  
#### Possible fixes ####

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:
    - bat-dg2-oem2:       [FAIL][23] ([Intel XE#400] / [Intel XE#616]) -> [PASS][24] +2 other tests pass
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-548-2c3aa5d8d87f6026a9fb60d2d78a9f4114722e24/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127347v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html

  * {igt@xe_create@create-execqueues-noleak}:
    - bat-adlp-7:         [FAIL][25] ([Intel XE#524]) -> [PASS][26]
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-548-2c3aa5d8d87f6026a9fb60d2d78a9f4114722e24/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127347v1/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html

  
#### Warnings ####

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-dg2-oem2:       [FAIL][27] ([Intel XE#480]) -> [FAIL][28] ([Intel XE#906])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-548-2c3aa5d8d87f6026a9fb60d2d78a9f4114722e24/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127347v1/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/400
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/482
  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#764]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/764
  [Intel XE#906]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/906
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346


Build changes
-------------

  * IGT: IGT_7618 -> IGT_7619
  * Linux: xe-548-2c3aa5d8d87f6026a9fb60d2d78a9f4114722e24 -> xe-pw-127347v1

  IGT_7618: 222d1bdf8c598bb12164deab127af5d8d7ddc070 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7619: 3f85d49fd78d439f0cd2c373227ff98bd6885332 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-548-2c3aa5d8d87f6026a9fb60d2d78a9f4114722e24: 2c3aa5d8d87f6026a9fb60d2d78a9f4114722e24
  xe-pw-127347v1: 127347v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127347v1/index.html

--===============8915136140843714019==
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
<tr><td><b>Series:</b></td><td>series starting with [CI,01/12] drm/gpuvm: convert WARN() to drm_WARN() variants</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/127347/">https://patchwork.freedesktop.org/series/127347/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127347v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127347v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-548-2c3aa5d8d87f6026a9fb60d2d78a9f4114722e24_BAT -&gt; xe-pw-127347v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-127347v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-127347v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-127347v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-548-2c3aa5d8d87f6026a9fb60d2d78a9f4114722e24/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127347v1/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-548-2c3aa5d8d87f6026a9fb60d2d78a9f4114722e24/bat-dg2-oem2/igt@kms_pipe_crc_basic@nonblocking-crc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127347v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@nonblocking-crc.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-dp-3:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-548-2c3aa5d8d87f6026a9fb60d2d78a9f4114722e24/bat-dg2-oem2/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-dp-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127347v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-dp-3.html">FAIL</a> +4 other tests fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-548-2c3aa5d8d87f6026a9fb60d2d78a9f4114722e24/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127347v1/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-cm:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-548-2c3aa5d8d87f6026a9fb60d2d78a9f4114722e24/bat-pvc-2/igt@xe_evict@evict-beng-small-cm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/482">Intel XE#482</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127347v1/bat-pvc-2/igt@xe_evict@evict-beng-small-cm.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@kms_psr@psr_cursor_plane_move}:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-548-2c3aa5d8d87f6026a9fb60d2d78a9f4114722e24/bat-adlp-7/igt@kms_psr@psr_cursor_plane_move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127347v1/bat-adlp-7/igt@kms_psr@psr_cursor_plane_move.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-127347v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-548-2c3aa5d8d87f6026a9fb60d2d78a9f4114722e24/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127347v1/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/764">Intel XE#764</a>)</p>
</li>
<li>
<p>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-548-2c3aa5d8d87f6026a9fb60d2d78a9f4114722e24/bat-atsm-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127347v1/bat-atsm-2/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/764">Intel XE#764</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-548-2c3aa5d8d87f6026a9fb60d2d78a9f4114722e24/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127347v1/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-548-2c3aa5d8d87f6026a9fb60d2d78a9f4114722e24/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127347v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@d-dp3:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-548-2c3aa5d8d87f6026a9fb60d2d78a9f4114722e24/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@d-dp3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127347v1/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@d-dp3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/906">Intel XE#906</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-548-2c3aa5d8d87f6026a9fb60d2d78a9f4114722e24/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/400">Intel XE#400</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127347v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>{igt@xe_create@create-execqueues-noleak}:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-548-2c3aa5d8d87f6026a9fb60d2d78a9f4114722e24/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/524">Intel XE#524</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127347v1/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-548-2c3aa5d8d87f6026a9fb60d2d78a9f4114722e24/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127347v1/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/906">Intel XE#906</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7618 -&gt; IGT_7619</li>
<li>Linux: xe-548-2c3aa5d8d87f6026a9fb60d2d78a9f4114722e24 -&gt; xe-pw-127347v1</li>
</ul>
<p>IGT_7618: 222d1bdf8c598bb12164deab127af5d8d7ddc070 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7619: 3f85d49fd78d439f0cd2c373227ff98bd6885332 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-548-2c3aa5d8d87f6026a9fb60d2d78a9f4114722e24: 2c3aa5d8d87f6026a9fb60d2d78a9f4114722e24<br />
  xe-pw-127347v1: 127347v1</p>

</body>
</html>

--===============8915136140843714019==--
