Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07107CEACCB
	for <intel-xe@archiver.kernel.org>; Tue,  1 Oct 2024 14:25:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF6DC10E636;
	Tue,  1 Oct 2024 14:25:14 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 889ED10E637;
 Tue,  1 Oct 2024 14:25:13 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4177187376193039880=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_drm/xe/uapi=3A_Restore_uapi_for_?=
 =?utf-8?q?access_counting?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: apoorva.singh@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 01 Oct 2024 14:25:13 -0000
Message-ID: <172779271355.1142294.15328184328274408375@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241001135432.447074-1-apoorva.singh@intel.com>
In-Reply-To: <20241001135432.447074-1-apoorva.singh@intel.com>
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

--===============4177187376193039880==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/uapi: Restore uapi for access counting
URL   : https://patchwork.freedesktop.org/series/139385/
State : failure

== Summary ==

CI Bug Log - changes from xe-1997-f3f61bfc1cddded910b3916aa2c576a14bf62f71_BAT -> xe-pw-139385v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-139385v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-139385v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-139385v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_queue_property@invalid-property:
    - bat-lnl-1:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1997-f3f61bfc1cddded910b3916aa2c576a14bf62f71/bat-lnl-1/igt@xe_exec_queue_property@invalid-property.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139385v1/bat-lnl-1/igt@xe_exec_queue_property@invalid-property.html
    - bat-pvc-2:          [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1997-f3f61bfc1cddded910b3916aa2c576a14bf62f71/bat-pvc-2/igt@xe_exec_queue_property@invalid-property.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139385v1/bat-pvc-2/igt@xe_exec_queue_property@invalid-property.html
    - bat-bmg-1:          [PASS][5] -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1997-f3f61bfc1cddded910b3916aa2c576a14bf62f71/bat-bmg-1/igt@xe_exec_queue_property@invalid-property.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139385v1/bat-bmg-1/igt@xe_exec_queue_property@invalid-property.html
    - bat-lnl-2:          [PASS][7] -> [FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1997-f3f61bfc1cddded910b3916aa2c576a14bf62f71/bat-lnl-2/igt@xe_exec_queue_property@invalid-property.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139385v1/bat-lnl-2/igt@xe_exec_queue_property@invalid-property.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@xe_exec_queue_property@invalid-property:
    - {bat-bmg-2}:        [PASS][9] -> [FAIL][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1997-f3f61bfc1cddded910b3916aa2c576a14bf62f71/bat-bmg-2/igt@xe_exec_queue_property@invalid-property.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139385v1/bat-bmg-2/igt@xe_exec_queue_property@invalid-property.html

  
Known issues
------------

  Here are the changes found in xe-pw-139385v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [PASS][11] -> [FAIL][12] ([Intel XE#1861])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1997-f3f61bfc1cddded910b3916aa2c576a14bf62f71/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139385v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  
#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-adlp-7:         [DMESG-WARN][13] ([Intel XE#2871]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1997-f3f61bfc1cddded910b3916aa2c576a14bf62f71/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139385v1/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html

  * igt@fbdev@write:
    - bat-bmg-1:          [DMESG-WARN][15] ([Intel XE#877]) -> [PASS][16] +1 other test pass
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1997-f3f61bfc1cddded910b3916aa2c576a14bf62f71/bat-bmg-1/igt@fbdev@write.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139385v1/bat-bmg-1/igt@fbdev@write.html

  * igt@kms_psr@psr-cursor-plane-move:
    - bat-adlp-7:         [SKIP][17] ([Intel XE#455]) -> [PASS][18] +3 other tests pass
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1997-f3f61bfc1cddded910b3916aa2c576a14bf62f71/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139385v1/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html

  * igt@kms_psr@psr-primary-page-flip@edp-1:
    - bat-adlp-7:         [DMESG-FAIL][19] ([Intel XE#2871]) -> [PASS][20] +1 other test pass
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1997-f3f61bfc1cddded910b3916aa2c576a14bf62f71/bat-adlp-7/igt@kms_psr@psr-primary-page-flip@edp-1.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139385v1/bat-adlp-7/igt@kms_psr@psr-primary-page-flip@edp-1.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#2871]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2871
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877


Build changes
-------------

  * Linux: xe-1997-f3f61bfc1cddded910b3916aa2c576a14bf62f71 -> xe-pw-139385v1

  IGT_8047: 2a1ef45992ee7569d9fc37be875fa78ce3aa5ab8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1997-f3f61bfc1cddded910b3916aa2c576a14bf62f71: f3f61bfc1cddded910b3916aa2c576a14bf62f71
  xe-pw-139385v1: 139385v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139385v1/index.html

--===============4177187376193039880==
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
<tr><td><b>Series:</b></td><td>drm/xe/uapi: Restore uapi for access counting</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/139385/">https://patchwork.freedesktop.org/series/139385/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139385v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139385v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1997-f3f61bfc1cddded910b3916aa2c576a14bf62f71_BAT -&gt; xe-pw-139385v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-139385v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-139385v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-139385v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_exec_queue_property@invalid-property:<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1997-f3f61bfc1cddded910b3916aa2c576a14bf62f71/bat-lnl-1/igt@xe_exec_queue_property@invalid-property.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139385v1/bat-lnl-1/igt@xe_exec_queue_property@invalid-property.html">FAIL</a></li>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1997-f3f61bfc1cddded910b3916aa2c576a14bf62f71/bat-pvc-2/igt@xe_exec_queue_property@invalid-property.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139385v1/bat-pvc-2/igt@xe_exec_queue_property@invalid-property.html">FAIL</a></li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1997-f3f61bfc1cddded910b3916aa2c576a14bf62f71/bat-bmg-1/igt@xe_exec_queue_property@invalid-property.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139385v1/bat-bmg-1/igt@xe_exec_queue_property@invalid-property.html">FAIL</a></li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1997-f3f61bfc1cddded910b3916aa2c576a14bf62f71/bat-lnl-2/igt@xe_exec_queue_property@invalid-property.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139385v1/bat-lnl-2/igt@xe_exec_queue_property@invalid-property.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@xe_exec_queue_property@invalid-property:<ul>
<li>{bat-bmg-2}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1997-f3f61bfc1cddded910b3916aa2c576a14bf62f71/bat-bmg-2/igt@xe_exec_queue_property@invalid-property.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139385v1/bat-bmg-2/igt@xe_exec_queue_property@invalid-property.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-139385v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@basic:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1997-f3f61bfc1cddded910b3916aa2c576a14bf62f71/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139385v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1997-f3f61bfc1cddded910b3916aa2c576a14bf62f71/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2871">Intel XE#2871</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139385v1/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1997-f3f61bfc1cddded910b3916aa2c576a14bf62f71/bat-bmg-1/igt@fbdev@write.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139385v1/bat-bmg-1/igt@fbdev@write.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1997-f3f61bfc1cddded910b3916aa2c576a14bf62f71/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139385v1/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip@edp-1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1997-f3f61bfc1cddded910b3916aa2c576a14bf62f71/bat-adlp-7/igt@kms_psr@psr-primary-page-flip@edp-1.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2871">Intel XE#2871</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139385v1/bat-adlp-7/igt@kms_psr@psr-primary-page-flip@edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1997-f3f61bfc1cddded910b3916aa2c576a14bf62f71 -&gt; xe-pw-139385v1</li>
</ul>
<p>IGT_8047: 2a1ef45992ee7569d9fc37be875fa78ce3aa5ab8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1997-f3f61bfc1cddded910b3916aa2c576a14bf62f71: f3f61bfc1cddded910b3916aa2c576a14bf62f71<br />
  xe-pw-139385v1: 139385v1</p>

</body>
</html>

--===============4177187376193039880==--
