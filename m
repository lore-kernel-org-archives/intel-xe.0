Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83701C3DA41
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jul 2024 21:16:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44FD310E324;
	Mon,  8 Jul 2024 21:16:47 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 481AB10E02F;
 Mon,  8 Jul 2024 21:16:46 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1955046163477894868=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_Have_xe=5Fvm_and_xe=5Fexec=5Fque?=
 =?utf-8?q?ue_take_references_to_xef?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 08 Jul 2024 21:16:46 -0000
Message-ID: <172047340628.67618.15813265063356053874@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240708202103.3347869-1-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20240708202103.3347869-1-umesh.nerlige.ramappa@intel.com>
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

--===============1955046163477894868==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Have xe_vm and xe_exec_queue take references to xef
URL   : https://patchwork.freedesktop.org/series/135865/
State : failure

== Summary ==

CI Bug Log - changes from xe-1576-1b010bec39a554cbbd0b51cbf49142e2f218013d_BAT -> xe-pw-135865v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-135865v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-135865v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (5 -> 4)
------------------------------

  Missing    (1): bat-pvc-2 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-135865v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-adlp-7:         [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1576-1b010bec39a554cbbd0b51cbf49142e2f218013d/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v1/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html
    - bat-dg2-oem2:       [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1576-1b010bec39a554cbbd0b51cbf49142e2f218013d/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v1/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html
    - bat-atsm-2:         [PASS][5] -> [ABORT][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1576-1b010bec39a554cbbd0b51cbf49142e2f218013d/bat-atsm-2/igt@core_hotunplug@unbind-rebind.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v1/bat-atsm-2/igt@core_hotunplug@unbind-rebind.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@xe_intel_bb@add-remove-objects:
    - {bat-lnl-1}:        [PASS][7] -> [INCOMPLETE][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1576-1b010bec39a554cbbd0b51cbf49142e2f218013d/bat-lnl-1/igt@xe_intel_bb@add-remove-objects.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v1/bat-lnl-1/igt@xe_intel_bb@add-remove-objects.html

  
Known issues
------------

  Here are the changes found in xe-pw-135865v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_live_ktest@xe_migrate:
    - bat-adlp-7:         [PASS][9] -> [SKIP][10] ([Intel XE#1192]) +2 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1576-1b010bec39a554cbbd0b51cbf49142e2f218013d/bat-adlp-7/igt@xe_live_ktest@xe_migrate.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v1/bat-adlp-7/igt@xe_live_ktest@xe_migrate.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192


Build changes
-------------

  * IGT: IGT_7919 -> IGT_7920
  * Linux: xe-1576-1b010bec39a554cbbd0b51cbf49142e2f218013d -> xe-pw-135865v1

  IGT_7919: 2c50c98273c55882bdc209fed77d0e40b24431f1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7920: 7920
  xe-1576-1b010bec39a554cbbd0b51cbf49142e2f218013d: 1b010bec39a554cbbd0b51cbf49142e2f218013d
  xe-pw-135865v1: 135865v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v1/index.html

--===============1955046163477894868==
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
<tr><td><b>Series:</b></td><td>Have xe_vm and xe_exec_queue take references to xef</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/135865/">https://patchwork.freedesktop.org/series/135865/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1576-1b010bec39a554cbbd0b51cbf49142e2f218013d_BAT -&gt; xe-pw-135865v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-135865v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-135865v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (5 -&gt; 4)</h2>
<p>Missing    (1): bat-pvc-2 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-135865v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1576-1b010bec39a554cbbd0b51cbf49142e2f218013d/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v1/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a></li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1576-1b010bec39a554cbbd0b51cbf49142e2f218013d/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v1/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html">ABORT</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1576-1b010bec39a554cbbd0b51cbf49142e2f218013d/bat-atsm-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v1/bat-atsm-2/igt@core_hotunplug@unbind-rebind.html">ABORT</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@xe_intel_bb@add-remove-objects:<ul>
<li>{bat-lnl-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1576-1b010bec39a554cbbd0b51cbf49142e2f218013d/bat-lnl-1/igt@xe_intel_bb@add-remove-objects.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v1/bat-lnl-1/igt@xe_intel_bb@add-remove-objects.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-135865v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_live_ktest@xe_migrate:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1576-1b010bec39a554cbbd0b51cbf49142e2f218013d/bat-adlp-7/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135865v1/bat-adlp-7/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7919 -&gt; IGT_7920</li>
<li>Linux: xe-1576-1b010bec39a554cbbd0b51cbf49142e2f218013d -&gt; xe-pw-135865v1</li>
</ul>
<p>IGT_7919: 2c50c98273c55882bdc209fed77d0e40b24431f1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7920: 7920<br />
  xe-1576-1b010bec39a554cbbd0b51cbf49142e2f218013d: 1b010bec39a554cbbd0b51cbf49142e2f218013d<br />
  xe-pw-135865v1: 135865v1</p>

</body>
</html>

--===============1955046163477894868==--
