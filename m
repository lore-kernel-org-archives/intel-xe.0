Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2EA8C369BD
	for <intel-xe@archiver.kernel.org>; Thu, 17 Apr 2025 00:52:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C56810E0AC;
	Thu, 17 Apr 2025 00:52:25 +0000 (UTC)
Received: from b68e5b3b99e1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02EB310E0AC;
 Thu, 17 Apr 2025 00:52:23 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3630174332926419666=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/xe/gsc=3A_test_new_GSC_?=
 =?utf-8?q?104=2E0=2E5=2E1429_for_LNL?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 17 Apr 2025 00:52:23 -0000
Message-ID: <174485114397.12081.10215585949012729457@b68e5b3b99e1>
X-Patchwork-Hint: ignore
References: <20250416233202.1303381-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20250416233202.1303381-1-daniele.ceraolospurio@intel.com>
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

--===============3630174332926419666==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/gsc: test new GSC 104.0.5.1429 for LNL
URL   : https://patchwork.freedesktop.org/series/147859/
State : failure

== Summary ==

CI Bug Log - changes from xe-2963-3ddaf724579194d7ac8fcc54e1d8e80bb81a7f74_BAT -> xe-pw-147859v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-147859v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-147859v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): bat-adlp-vm 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-147859v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_balancer@no-exec-virtual-basic:
    - bat-lnl-2:          NOTRUN -> [SKIP][1] +193 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v1/bat-lnl-2/igt@xe_exec_balancer@no-exec-virtual-basic.html

  * igt@xe_live_ktest@xe_bo:
    - bat-lnl-1:          NOTRUN -> [FAIL][2] +7 other tests fail
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v1/bat-lnl-1/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_migrate:
    - bat-lnl-2:          NOTRUN -> [FAIL][3] +7 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v1/bat-lnl-2/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_mmap@cpu-caching:
    - bat-lnl-1:          NOTRUN -> [SKIP][4] +242 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v1/bat-lnl-1/igt@xe_mmap@cpu-caching.html

  * igt@xe_module_load@load:
    - bat-lnl-1:          [PASS][5] -> [DMESG-FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2963-3ddaf724579194d7ac8fcc54e1d8e80bb81a7f74/bat-lnl-1/igt@xe_module_load@load.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v1/bat-lnl-1/igt@xe_module_load@load.html
    - bat-lnl-2:          [PASS][7] -> [DMESG-FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2963-3ddaf724579194d7ac8fcc54e1d8e80bb81a7f74/bat-lnl-2/igt@xe_module_load@load.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v1/bat-lnl-2/igt@xe_module_load@load.html

  
Known issues
------------

  Here are the changes found in xe-pw-147859v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@eof:
    - bat-lnl-1:          [PASS][9] -> [SKIP][10] ([Intel XE#2134]) +4 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2963-3ddaf724579194d7ac8fcc54e1d8e80bb81a7f74/bat-lnl-1/igt@fbdev@eof.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v1/bat-lnl-1/igt@fbdev@eof.html

  * igt@intel_sysfs_debugfs@xe-base:
    - bat-lnl-2:          [PASS][11] -> [SKIP][12] ([Intel XE#4618])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2963-3ddaf724579194d7ac8fcc54e1d8e80bb81a7f74/bat-lnl-2/igt@intel_sysfs_debugfs@xe-base.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v1/bat-lnl-2/igt@intel_sysfs_debugfs@xe-base.html

  * igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries:
    - bat-lnl-1:          [PASS][13] -> [SKIP][14] ([Intel XE#4618]) +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2963-3ddaf724579194d7ac8fcc54e1d8e80bb81a7f74/bat-lnl-1/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v1/bat-lnl-1/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries.html

  * igt@intel_sysfs_debugfs@xe-forcewake:
    - bat-lnl-2:          NOTRUN -> [SKIP][15] ([Intel XE#4618]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v1/bat-lnl-2/igt@intel_sysfs_debugfs@xe-forcewake.html

  * igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries:
    - bat-lnl-1:          NOTRUN -> [SKIP][16] ([Intel XE#4618])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v1/bat-lnl-1/igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries.html

  * igt@kms_addfb_basic@bad-pitch-0:
    - bat-lnl-2:          NOTRUN -> [SKIP][17] ([Intel XE#2235]) +48 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v1/bat-lnl-2/igt@kms_addfb_basic@bad-pitch-0.html

  * igt@kms_dsc@dsc-basic:
    - bat-lnl-2:          NOTRUN -> [SKIP][18] ([Intel XE#2235] / [Intel XE#2351]) +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v1/bat-lnl-2/igt@kms_dsc@dsc-basic.html

  * igt@kms_psr@psr-cursor-plane-move:
    - bat-lnl-2:          NOTRUN -> [SKIP][19] ([Intel XE#2351]) +2 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v1/bat-lnl-2/igt@kms_psr@psr-cursor-plane-move.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - bat-lnl-1:          NOTRUN -> [SKIP][20] ([Intel XE#2351]) +4 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v1/bat-lnl-1/igt@kms_psr@psr-sprite-plane-onoff.html

  
#### Warnings ####

  * igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries:
    - bat-lnl-2:          [ABORT][21] ([Intel XE#4749]) -> [SKIP][22] ([Intel XE#4618])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2963-3ddaf724579194d7ac8fcc54e1d8e80bb81a7f74/bat-lnl-2/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v1/bat-lnl-2/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries.html

  * igt@intel_sysfs_debugfs@xe-forcewake:
    - bat-lnl-1:          [ABORT][23] ([Intel XE#4624]) -> [SKIP][24] ([Intel XE#4618])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2963-3ddaf724579194d7ac8fcc54e1d8e80bb81a7f74/bat-lnl-1/igt@intel_sysfs_debugfs@xe-forcewake.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v1/bat-lnl-1/igt@intel_sysfs_debugfs@xe-forcewake.html

  
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2235]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#4618]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4618
  [Intel XE#4624]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4624
  [Intel XE#4749]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4749


Build changes
-------------

  * Linux: xe-2963-3ddaf724579194d7ac8fcc54e1d8e80bb81a7f74 -> xe-pw-147859v1

  IGT_8324: 8a49d9fa87e4de87afd3c3ec6828caf27e07b254 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2963-3ddaf724579194d7ac8fcc54e1d8e80bb81a7f74: 3ddaf724579194d7ac8fcc54e1d8e80bb81a7f74
  xe-pw-147859v1: 147859v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v1/index.html

--===============3630174332926419666==
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
<tr><td><b>Series:</b></td><td>drm/xe/gsc: test new GSC 104.0.5.1429 for LNL</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/147859/">https://patchwork.freedesktop.org/series/147859/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2963-3ddaf724579194d7ac8fcc54e1d8e80bb81a7f74_BAT -&gt; xe-pw-147859v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-147859v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-147859v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-147859v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_exec_balancer@no-exec-virtual-basic:</p>
<ul>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v1/bat-lnl-2/igt@xe_exec_balancer@no-exec-virtual-basic.html">SKIP</a> +193 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v1/bat-lnl-1/igt@xe_live_ktest@xe_bo.html">FAIL</a> +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v1/bat-lnl-2/igt@xe_live_ktest@xe_migrate.html">FAIL</a> +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@cpu-caching:</p>
<ul>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v1/bat-lnl-1/igt@xe_mmap@cpu-caching.html">SKIP</a> +242 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2963-3ddaf724579194d7ac8fcc54e1d8e80bb81a7f74/bat-lnl-1/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v1/bat-lnl-1/igt@xe_module_load@load.html">DMESG-FAIL</a></li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2963-3ddaf724579194d7ac8fcc54e1d8e80bb81a7f74/bat-lnl-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v1/bat-lnl-2/igt@xe_module_load@load.html">DMESG-FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-147859v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2963-3ddaf724579194d7ac8fcc54e1d8e80bb81a7f74/bat-lnl-1/igt@fbdev@eof.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v1/bat-lnl-1/igt@fbdev@eof.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@intel_sysfs_debugfs@xe-base:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2963-3ddaf724579194d7ac8fcc54e1d8e80bb81a7f74/bat-lnl-2/igt@intel_sysfs_debugfs@xe-base.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v1/bat-lnl-2/igt@intel_sysfs_debugfs@xe-base.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4618">Intel XE#4618</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2963-3ddaf724579194d7ac8fcc54e1d8e80bb81a7f74/bat-lnl-1/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v1/bat-lnl-1/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4618">Intel XE#4618</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@intel_sysfs_debugfs@xe-forcewake:</p>
<ul>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v1/bat-lnl-2/igt@intel_sysfs_debugfs@xe-forcewake.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4618">Intel XE#4618</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries:</p>
<ul>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v1/bat-lnl-1/igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4618">Intel XE#4618</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bad-pitch-0:</p>
<ul>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v1/bat-lnl-2/igt@kms_addfb_basic@bad-pitch-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a>) +48 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v1/bat-lnl-2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v1/bat-lnl-2/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v1/bat-lnl-1/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +4 other tests skip</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2963-3ddaf724579194d7ac8fcc54e1d8e80bb81a7f74/bat-lnl-2/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4749">Intel XE#4749</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v1/bat-lnl-2/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4618">Intel XE#4618</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_sysfs_debugfs@xe-forcewake:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2963-3ddaf724579194d7ac8fcc54e1d8e80bb81a7f74/bat-lnl-1/igt@intel_sysfs_debugfs@xe-forcewake.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4624">Intel XE#4624</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147859v1/bat-lnl-1/igt@intel_sysfs_debugfs@xe-forcewake.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4618">Intel XE#4618</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2963-3ddaf724579194d7ac8fcc54e1d8e80bb81a7f74 -&gt; xe-pw-147859v1</li>
</ul>
<p>IGT_8324: 8a49d9fa87e4de87afd3c3ec6828caf27e07b254 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2963-3ddaf724579194d7ac8fcc54e1d8e80bb81a7f74: 3ddaf724579194d7ac8fcc54e1d8e80bb81a7f74<br />
  xe-pw-147859v1: 147859v1</p>

</body>
</html>

--===============3630174332926419666==--
