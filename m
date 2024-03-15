Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF9EBC54E67
	for <intel-xe@archiver.kernel.org>; Fri, 15 Mar 2024 11:51:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1CA81121F0;
	Fri, 15 Mar 2024 11:51:49 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EAAB1121F1;
 Fri, 15 Mar 2024 11:51:48 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8940853956610949456=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_Add_support_for_Wa_KLVs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Badal Nilawar" <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 15 Mar 2024 11:51:48 -0000
Message-ID: <171050350845.795503.4818741034691589748@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240315112147.2460691-1-badal.nilawar@intel.com>
In-Reply-To: <20240315112147.2460691-1-badal.nilawar@intel.com>
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

--===============8940853956610949456==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add support for Wa KLVs
URL   : https://patchwork.freedesktop.org/series/131179/
State : success

== Summary ==

CI Bug Log - changes from xe-947-601f578c8c069e990adab2f8a6d94c549d7d0fe1_BAT -> xe-pw-131179v1_BAT
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

  Here are the changes found in xe-pw-131179v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_threads@threads-mixed-shared-vm-basic:
    - bat-pvc-2:          [PASS][1] -> [DMESG-WARN][2] ([Intel XE#1238])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-947-601f578c8c069e990adab2f8a6d94c549d7d0fe1/bat-pvc-2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131179v1/bat-pvc-2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html

  
#### Possible fixes ####

  * igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:
    - bat-dg2-oem2:       [DMESG-WARN][3] ([Intel XE#1009]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-947-601f578c8c069e990adab2f8a6d94c549d7d0fe1/bat-dg2-oem2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131179v1/bat-dg2-oem2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html

  * igt@xe_evict@evict-cm-threads-small:
    - bat-dg2-oem2:       [TIMEOUT][5] -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-947-601f578c8c069e990adab2f8a6d94c549d7d0fe1/bat-dg2-oem2/igt@xe_evict@evict-cm-threads-small.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131179v1/bat-dg2-oem2/igt@xe_evict@evict-cm-threads-small.html

  * igt@xe_exec_threads@threads-mixed-basic:
    - bat-dg2-oem2:       [DMESG-FAIL][7] -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-947-601f578c8c069e990adab2f8a6d94c549d7d0fe1/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-basic.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131179v1/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-basic.html

  * igt@xe_live_ktest@xe_migrate:
    - bat-dg2-oem2:       [SKIP][9] ([Intel XE#1192]) -> [PASS][10] +2 other tests pass
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-947-601f578c8c069e990adab2f8a6d94c549d7d0fe1/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131179v1/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html

  
  [Intel XE#1009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1009
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1238]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1238


Build changes
-------------

  * Linux: xe-947-601f578c8c069e990adab2f8a6d94c549d7d0fe1 -> xe-pw-131179v1

  IGT_7768: 7768
  xe-947-601f578c8c069e990adab2f8a6d94c549d7d0fe1: 601f578c8c069e990adab2f8a6d94c549d7d0fe1
  xe-pw-131179v1: 131179v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131179v1/index.html

--===============8940853956610949456==
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
<tr><td><b>Series:</b></td><td>Add support for Wa KLVs</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131179/">https://patchwork.freedesktop.org/series/131179/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131179v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131179v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-947-601f578c8c069e990adab2f8a6d94c549d7d0fe1_BAT -&gt; xe-pw-131179v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-131179v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_exec_threads@threads-mixed-shared-vm-basic:<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-947-601f578c8c069e990adab2f8a6d94c549d7d0fe1/bat-pvc-2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131179v1/bat-pvc-2/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1238">Intel XE#1238</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-947-601f578c8c069e990adab2f8a6d94c549d7d0fe1/bat-dg2-oem2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1009">Intel XE#1009</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131179v1/bat-dg2-oem2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-small:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-947-601f578c8c069e990adab2f8a6d94c549d7d0fe1/bat-dg2-oem2/igt@xe_evict@evict-cm-threads-small.html">TIMEOUT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131179v1/bat-dg2-oem2/igt@xe_evict@evict-cm-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-basic:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-947-601f578c8c069e990adab2f8a6d94c549d7d0fe1/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-basic.html">DMESG-FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131179v1/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-947-601f578c8c069e990adab2f8a6d94c549d7d0fe1/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131179v1/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-947-601f578c8c069e990adab2f8a6d94c549d7d0fe1 -&gt; xe-pw-131179v1</li>
</ul>
<p>IGT_7768: 7768<br />
  xe-947-601f578c8c069e990adab2f8a6d94c549d7d0fe1: 601f578c8c069e990adab2f8a6d94c549d7d0fe1<br />
  xe-pw-131179v1: 131179v1</p>

</body>
</html>

--===============8940853956610949456==--
