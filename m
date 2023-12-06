Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28DE7C4167B
	for <intel-xe@archiver.kernel.org>; Wed,  6 Dec 2023 09:07:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBBEB10E4F7;
	Wed,  6 Dec 2023 09:07:36 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id EB18E10E4F7;
 Wed,  6 Dec 2023 09:07:34 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id E324DA47DF;
 Wed,  6 Dec 2023 09:07:34 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3435521946098909870=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Date: Wed, 06 Dec 2023 09:07:34 -0000
Message-ID: <170185365489.26426.7727004384705638972@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231206043126.984049-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20231206043126.984049-1-himal.prasad.ghimiray@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_Enable_co?=
 =?utf-8?q?mpression_handling_on_LNL=2E_=28rev5=29?=
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

--===============3435521946098909870==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Enable compression handling on LNL. (rev5)
URL   : https://patchwork.freedesktop.org/series/126704/
State : failure

== Summary ==

CI Bug Log - changes from xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a_BAT -> xe-pw-126704v5_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-126704v5_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-126704v5_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-126704v5_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_pat@prime-external-import-coh:
    - bat-adlp-7:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a/bat-adlp-7/igt@xe_pat@prime-external-import-coh.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126704v5/bat-adlp-7/igt@xe_pat@prime-external-import-coh.html
    - bat-dg2-oem2:       [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a/bat-dg2-oem2/igt@xe_pat@prime-external-import-coh.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126704v5/bat-dg2-oem2/igt@xe_pat@prime-external-import-coh.html
    - bat-atsm-2:         [PASS][5] -> [INCOMPLETE][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a/bat-atsm-2/igt@xe_pat@prime-external-import-coh.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126704v5/bat-atsm-2/igt@xe_pat@prime-external-import-coh.html
    - bat-pvc-2:          [PASS][7] -> [INCOMPLETE][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a/bat-pvc-2/igt@xe_pat@prime-external-import-coh.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126704v5/bat-pvc-2/igt@xe_pat@prime-external-import-coh.html

  
Known issues
------------

  Here are the changes found in xe-pw-126704v5_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_create@create-execqueues-leak:
    - bat-atsm-2:         [PASS][9] -> [FAIL][10] ([Intel XE#524])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a/bat-atsm-2/igt@xe_create@create-execqueues-leak.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126704v5/bat-atsm-2/igt@xe_create@create-execqueues-leak.html

  
#### Possible fixes ####

  * igt@xe_prime_self_import@basic-with_fd_dup:
    - bat-atsm-2:         [FAIL][11] ([Intel XE#999]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a/bat-atsm-2/igt@xe_prime_self_import@basic-with_fd_dup.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126704v5/bat-atsm-2/igt@xe_prime_self_import@basic-with_fd_dup.html

  
#### Warnings ####

  * igt@xe_prime_self_import@basic-with_one_bo:
    - bat-atsm-2:         [FAIL][13] -> [FAIL][14] ([Intel XE#999])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a/bat-atsm-2/igt@xe_prime_self_import@basic-with_one_bo.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126704v5/bat-atsm-2/igt@xe_prime_self_import@basic-with_one_bo.html
    - bat-pvc-2:          [FAIL][15] -> [FAIL][16] ([Intel XE#999])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a/bat-pvc-2/igt@xe_prime_self_import@basic-with_one_bo.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126704v5/bat-pvc-2/igt@xe_prime_self_import@basic-with_one_bo.html

  
  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524
  [Intel XE#999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/999


Build changes
-------------

  * Linux: xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a -> xe-pw-126704v5

  IGT_7622: 48a47d91b7727215b965690c69d84159c8fb1aa2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a: 9d76164e08c68a3d5d081ff7b07c15a2cadf741a
  xe-pw-126704v5: 126704v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126704v5/index.html

--===============3435521946098909870==
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
<tr><td><b>Series:</b></td><td>Enable compression handling on LNL. (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/126704/">https://patchwork.freedesktop.org/series/126704/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126704v5/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126704v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a_BAT -&gt; xe-pw-126704v5_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-126704v5_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-126704v5_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-126704v5_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_pat@prime-external-import-coh:</p>
<ul>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a/bat-adlp-7/igt@xe_pat@prime-external-import-coh.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126704v5/bat-adlp-7/igt@xe_pat@prime-external-import-coh.html">INCOMPLETE</a></p>
</li>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a/bat-dg2-oem2/igt@xe_pat@prime-external-import-coh.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126704v5/bat-dg2-oem2/igt@xe_pat@prime-external-import-coh.html">INCOMPLETE</a></p>
</li>
<li>
<p>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a/bat-atsm-2/igt@xe_pat@prime-external-import-coh.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126704v5/bat-atsm-2/igt@xe_pat@prime-external-import-coh.html">INCOMPLETE</a></p>
</li>
<li>
<p>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a/bat-pvc-2/igt@xe_pat@prime-external-import-coh.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126704v5/bat-pvc-2/igt@xe_pat@prime-external-import-coh.html">INCOMPLETE</a></p>
</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-126704v5_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_create@create-execqueues-leak:<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a/bat-atsm-2/igt@xe_create@create-execqueues-leak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126704v5/bat-atsm-2/igt@xe_create@create-execqueues-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/524">Intel XE#524</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_prime_self_import@basic-with_fd_dup:<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a/bat-atsm-2/igt@xe_prime_self_import@basic-with_fd_dup.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/999">Intel XE#999</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126704v5/bat-atsm-2/igt@xe_prime_self_import@basic-with_fd_dup.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@xe_prime_self_import@basic-with_one_bo:</p>
<ul>
<li>
<p>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a/bat-atsm-2/igt@xe_prime_self_import@basic-with_one_bo.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126704v5/bat-atsm-2/igt@xe_prime_self_import@basic-with_one_bo.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/999">Intel XE#999</a>)</p>
</li>
<li>
<p>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a/bat-pvc-2/igt@xe_prime_self_import@basic-with_one_bo.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126704v5/bat-pvc-2/igt@xe_prime_self_import@basic-with_one_bo.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/999">Intel XE#999</a>)</p>
</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a -&gt; xe-pw-126704v5</li>
</ul>
<p>IGT_7622: 48a47d91b7727215b965690c69d84159c8fb1aa2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-554-9d76164e08c68a3d5d081ff7b07c15a2cadf741a: 9d76164e08c68a3d5d081ff7b07c15a2cadf741a<br />
  xe-pw-126704v5: 126704v5</p>

</body>
</html>

--===============3435521946098909870==--
