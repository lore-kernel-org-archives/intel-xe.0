Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A114FC07548
	for <intel-xe@archiver.kernel.org>; Wed, 15 Nov 2023 04:21:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 326E010E23A;
	Wed, 15 Nov 2023 04:21:21 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id AB52E10E23A;
 Wed, 15 Nov 2023 04:21:19 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id A5356A882E;
 Wed, 15 Nov 2023 04:21:19 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3297705132978928836=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Wed, 15 Nov 2023 04:21:19 -0000
Message-ID: <170002207965.647.7851765220408726577@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231115031508.173140-1-matthew.brost@intel.com>
In-Reply-To: <20231115031508.173140-1-matthew.brost@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A?=
 =?utf-8?q?_Only_set_xe=5Fvma=5Fop=2Emap_fields_for_GPUVA_map_operations?=
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

--===============3297705132978928836==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Only set xe_vma_op.map fields for GPUVA map operations
URL   : https://patchwork.freedesktop.org/series/126438/
State : success

== Summary ==

CI Bug Log - changes from xe-490-2fe82053d916d09ffcc92bc27294c9eed4e4804b_BAT -> xe-pw-126438v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-126438v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:
    - bat-adlp-7:         [PASS][1] -> [FAIL][2] ([Intel XE#480]) +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-490-2fe82053d916d09ffcc92bc27294c9eed4e4804b/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126438v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html

  
#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3:
    - bat-dg2-oem2:       [FAIL][3] -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-490-2fe82053d916d09ffcc92bc27294c9eed4e4804b/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126438v1/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@d-dp3:
    - bat-dg2-oem2:       [FAIL][5] ([Intel XE#906]) -> [PASS][6] +1 other test pass
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-490-2fe82053d916d09ffcc92bc27294c9eed4e4804b/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@d-dp3.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126438v1/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@d-dp3.html

  * {igt@xe_create@create-execqueues-leak}:
    - bat-atsm-2:         [FAIL][7] ([Intel XE#524]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-490-2fe82053d916d09ffcc92bc27294c9eed4e4804b/bat-atsm-2/igt@xe_create@create-execqueues-leak.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126438v1/bat-atsm-2/igt@xe_create@create-execqueues-leak.html

  
#### Warnings ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [DMESG-FAIL][9] ([Intel XE#282] / [i915#2017]) -> [FAIL][10] ([Intel XE#616] / [Intel XE#750])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-490-2fe82053d916d09ffcc92bc27294c9eed4e4804b/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126438v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#750]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/750
  [Intel XE#906]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/906
  [i915#2017]: https://gitlab.freedesktop.org/drm/intel/issues/2017


Build changes
-------------

  * Linux: xe-490-2fe82053d916d09ffcc92bc27294c9eed4e4804b -> xe-pw-126438v1

  IGT_7588: 328c5873b8f061267fdf86ed32cb5ecc611ba081 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-490-2fe82053d916d09ffcc92bc27294c9eed4e4804b: 2fe82053d916d09ffcc92bc27294c9eed4e4804b
  xe-pw-126438v1: 126438v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126438v1/index.html

--===============3297705132978928836==
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
<tr><td><b>Series:</b></td><td>drm/xe: Only set xe_vma_op.map fields for GPUVA map operations</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/126438/">https://patchwork.freedesktop.org/series/126438/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126438v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126438v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-490-2fe82053d916d09ffcc92bc27294c9eed4e4804b_BAT -&gt; xe-pw-126438v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-126438v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-490-2fe82053d916d09ffcc92bc27294c9eed4e4804b/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126438v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) +1 other test fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-490-2fe82053d916d09ffcc92bc27294c9eed4e4804b/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126438v1/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@d-dp3:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-490-2fe82053d916d09ffcc92bc27294c9eed4e4804b/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@d-dp3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/906">Intel XE#906</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126438v1/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@d-dp3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>{igt@xe_create@create-execqueues-leak}:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-490-2fe82053d916d09ffcc92bc27294c9eed4e4804b/bat-atsm-2/igt@xe_create@create-execqueues-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/524">Intel XE#524</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126438v1/bat-atsm-2/igt@xe_create@create-execqueues-leak.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@basic:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-490-2fe82053d916d09ffcc92bc27294c9eed4e4804b/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2017">i915#2017</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126438v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/750">Intel XE#750</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-490-2fe82053d916d09ffcc92bc27294c9eed4e4804b -&gt; xe-pw-126438v1</li>
</ul>
<p>IGT_7588: 328c5873b8f061267fdf86ed32cb5ecc611ba081 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-490-2fe82053d916d09ffcc92bc27294c9eed4e4804b: 2fe82053d916d09ffcc92bc27294c9eed4e4804b<br />
  xe-pw-126438v1: 126438v1</p>

</body>
</html>

--===============3297705132978928836==--
