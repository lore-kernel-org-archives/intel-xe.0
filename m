Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AB70C3DA61
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jul 2024 09:35:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61CA310E68F;
	Thu, 18 Jul 2024 09:35:50 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D856310E68F;
 Thu, 18 Jul 2024 09:35:48 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7908069496076538934=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_Build_PM_into_GuC_CT_layer?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 18 Jul 2024 09:35:48 -0000
Message-ID: <172129534887.272449.11155664152741494517@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240718084519.1478010-1-matthew.brost@intel.com>
In-Reply-To: <20240718084519.1478010-1-matthew.brost@intel.com>
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

--===============7908069496076538934==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Build PM into GuC CT layer
URL   : https://patchwork.freedesktop.org/series/136226/
State : failure

== Summary ==

CI Bug Log - changes from xe-1622-c2610cb0857b1e68f684691f6d3e7fb110f7149f_BAT -> xe-pw-136226v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-136226v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-136226v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (7 -> 7)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-136226v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [PASS][1] -> [DMESG-FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1622-c2610cb0857b1e68f684691f6d3e7fb110f7149f/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136226v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  * igt@xe_intel_bb@render:
    - bat-atsm-2:         [PASS][3] -> [DMESG-WARN][4] +21 other tests dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1622-c2610cb0857b1e68f684691f6d3e7fb110f7149f/bat-atsm-2/igt@xe_intel_bb@render.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136226v1/bat-atsm-2/igt@xe_intel_bb@render.html

  
#### Warnings ####

  * igt@xe_evict@evict-beng-small-external:
    - bat-pvc-2:          [FAIL][5] ([Intel XE#1000]) -> [DMESG-FAIL][6] +3 other tests dmesg-fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1622-c2610cb0857b1e68f684691f6d3e7fb110f7149f/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136226v1/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@xe_intel_bb@render@render-tile64-256}:
    - bat-atsm-2:         [PASS][7] -> [DMESG-WARN][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1622-c2610cb0857b1e68f684691f6d3e7fb110f7149f/bat-atsm-2/igt@xe_intel_bb@render@render-tile64-256.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136226v1/bat-atsm-2/igt@xe_intel_bb@render@render-tile64-256.html

  
Known issues
------------

  Here are the changes found in xe-pw-136226v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_intel_bb@intel-bb-blit-y:
    - bat-pvc-2:          [PASS][9] -> [DMESG-WARN][10] ([Intel XE#1705]) +17 other tests dmesg-warn
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1622-c2610cb0857b1e68f684691f6d3e7fb110f7149f/bat-pvc-2/igt@xe_intel_bb@intel-bb-blit-y.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136226v1/bat-pvc-2/igt@xe_intel_bb@intel-bb-blit-y.html

  * igt@xe_live_ktest@xe_migrate:
    - bat-pvc-2:          [PASS][11] -> [SKIP][12] ([Intel XE#2109]) +2 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1622-c2610cb0857b1e68f684691f6d3e7fb110f7149f/bat-pvc-2/igt@xe_live_ktest@xe_migrate.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136226v1/bat-pvc-2/igt@xe_live_ktest@xe_migrate.html
    - bat-atsm-2:         [PASS][13] -> [SKIP][14] ([Intel XE#2109]) +2 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1622-c2610cb0857b1e68f684691f6d3e7fb110f7149f/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136226v1/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html

  
#### Possible fixes ####

  * igt@xe_exec_balancer@twice-virtual-userptr-rebind:
    - {bat-bmg-1}:        [DMESG-WARN][15] ([Intel XE#877]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1622-c2610cb0857b1e68f684691f6d3e7fb110f7149f/bat-bmg-1/igt@xe_exec_balancer@twice-virtual-userptr-rebind.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136226v1/bat-bmg-1/igt@xe_exec_balancer@twice-virtual-userptr-rebind.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1705
  [Intel XE#2109]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2109
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877


Build changes
-------------

  * Linux: xe-1622-c2610cb0857b1e68f684691f6d3e7fb110f7149f -> xe-pw-136226v1

  IGT_7929: 7929
  xe-1622-c2610cb0857b1e68f684691f6d3e7fb110f7149f: c2610cb0857b1e68f684691f6d3e7fb110f7149f
  xe-pw-136226v1: 136226v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136226v1/index.html

--===============7908069496076538934==
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
<tr><td><b>Series:</b></td><td>Build PM into GuC CT layer</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136226/">https://patchwork.freedesktop.org/series/136226/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136226v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136226v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1622-c2610cb0857b1e68f684691f6d3e7fb110f7149f_BAT -&gt; xe-pw-136226v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-136226v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-136226v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-136226v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1622-c2610cb0857b1e68f684691f6d3e7fb110f7149f/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136226v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@render:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1622-c2610cb0857b1e68f684691f6d3e7fb110f7149f/bat-atsm-2/igt@xe_intel_bb@render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136226v1/bat-atsm-2/igt@xe_intel_bb@render.html">DMESG-WARN</a> +21 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_evict@evict-beng-small-external:<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1622-c2610cb0857b1e68f684691f6d3e7fb110f7149f/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136226v1/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html">DMESG-FAIL</a> +3 other tests dmesg-fail</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@xe_intel_bb@render@render-tile64-256}:<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1622-c2610cb0857b1e68f684691f6d3e7fb110f7149f/bat-atsm-2/igt@xe_intel_bb@render@render-tile64-256.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136226v1/bat-atsm-2/igt@xe_intel_bb@render@render-tile64-256.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-136226v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_intel_bb@intel-bb-blit-y:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1622-c2610cb0857b1e68f684691f6d3e7fb110f7149f/bat-pvc-2/igt@xe_intel_bb@intel-bb-blit-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136226v1/bat-pvc-2/igt@xe_intel_bb@intel-bb-blit-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1705">Intel XE#1705</a>) +17 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1622-c2610cb0857b1e68f684691f6d3e7fb110f7149f/bat-pvc-2/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136226v1/bat-pvc-2/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2109">Intel XE#2109</a>) +2 other tests skip</li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1622-c2610cb0857b1e68f684691f6d3e7fb110f7149f/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136226v1/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2109">Intel XE#2109</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_exec_balancer@twice-virtual-userptr-rebind:<ul>
<li>{bat-bmg-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1622-c2610cb0857b1e68f684691f6d3e7fb110f7149f/bat-bmg-1/igt@xe_exec_balancer@twice-virtual-userptr-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136226v1/bat-bmg-1/igt@xe_exec_balancer@twice-virtual-userptr-rebind.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1622-c2610cb0857b1e68f684691f6d3e7fb110f7149f -&gt; xe-pw-136226v1</li>
</ul>
<p>IGT_7929: 7929<br />
  xe-1622-c2610cb0857b1e68f684691f6d3e7fb110f7149f: c2610cb0857b1e68f684691f6d3e7fb110f7149f<br />
  xe-pw-136226v1: 136226v1</p>

</body>
</html>

--===============7908069496076538934==--
