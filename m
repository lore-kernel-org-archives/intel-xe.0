Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2945C48260
	for <intel-xe@archiver.kernel.org>; Fri, 16 Feb 2024 14:59:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77ED610E1B6;
	Fri, 16 Feb 2024 14:59:43 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 799B510E1B6;
 Fri, 16 Feb 2024 14:59:42 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0010900355666240691=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_drm/xe/uapi=3A_Remove_unused_fla?=
 =?utf-8?q?gs_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 16 Feb 2024 14:59:42 -0000
Message-ID: <170809558249.37759.10623699476003043049@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240216135333.6-1-francois.dugast@intel.com>
In-Reply-To: <20240216135333.6-1-francois.dugast@intel.com>
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

--===============0010900355666240691==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/uapi: Remove unused flags (rev2)
URL   : https://patchwork.freedesktop.org/series/129781/
State : failure

== Summary ==

CI Bug Log - changes from xe-791-2b0582c5f6c84859252ce7da41fc8829c88e17a7_BAT -> xe-pw-129781v2_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-129781v2_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-129781v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-129781v2_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
    - bat-pvc-2:          [PASS][1] -> [FAIL][2] +9 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-791-2b0582c5f6c84859252ce7da41fc8829c88e17a7/bat-pvc-2/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129781v2/bat-pvc-2/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@xe_live_ktest@xe_migrate}:
    - bat-dg2-oem2:       [PASS][3] -> [SKIP][4] +2 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-791-2b0582c5f6c84859252ce7da41fc8829c88e17a7/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129781v2/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html

  
Known issues
------------

  Here are the changes found in xe-pw-129781v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_evict@evict-mixed-threads-small-multi-vm:
    - bat-dg2-oem2:       [PASS][5] -> [DMESG-WARN][6] ([Intel XE#1009])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-791-2b0582c5f6c84859252ce7da41fc8829c88e17a7/bat-dg2-oem2/igt@xe_evict@evict-mixed-threads-small-multi-vm.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129781v2/bat-dg2-oem2/igt@xe_evict@evict-mixed-threads-small-multi-vm.html

  * igt@xe_exec_threads@threads-basic:
    - bat-dg2-oem2:       [PASS][7] -> [DMESG-WARN][8] ([Intel XE#1232])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-791-2b0582c5f6c84859252ce7da41fc8829c88e17a7/bat-dg2-oem2/igt@xe_exec_threads@threads-basic.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129781v2/bat-dg2-oem2/igt@xe_exec_threads@threads-basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1009
  [Intel XE#1232]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1232


Build changes
-------------

  * Linux: xe-791-2b0582c5f6c84859252ce7da41fc8829c88e17a7 -> xe-pw-129781v2

  IGT_7716: 7716
  xe-791-2b0582c5f6c84859252ce7da41fc8829c88e17a7: 2b0582c5f6c84859252ce7da41fc8829c88e17a7
  xe-pw-129781v2: 129781v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129781v2/index.html

--===============0010900355666240691==
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
<tr><td><b>Series:</b></td><td>drm/xe/uapi: Remove unused flags (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/129781/">https://patchwork.freedesktop.org/series/129781/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129781v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129781v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-791-2b0582c5f6c84859252ce7da41fc8829c88e17a7_BAT -&gt; xe-pw-129781v2_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-129781v2_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-129781v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-129781v2_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_exec_fault_mode@twice-userptr-rebind-imm:<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-791-2b0582c5f6c84859252ce7da41fc8829c88e17a7/bat-pvc-2/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129781v2/bat-pvc-2/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">FAIL</a> +9 other tests fail</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@xe_live_ktest@xe_migrate}:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-791-2b0582c5f6c84859252ce7da41fc8829c88e17a7/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129781v2/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-129781v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_evict@evict-mixed-threads-small-multi-vm:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-791-2b0582c5f6c84859252ce7da41fc8829c88e17a7/bat-dg2-oem2/igt@xe_evict@evict-mixed-threads-small-multi-vm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129781v2/bat-dg2-oem2/igt@xe_evict@evict-mixed-threads-small-multi-vm.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1009">Intel XE#1009</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-basic:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-791-2b0582c5f6c84859252ce7da41fc8829c88e17a7/bat-dg2-oem2/igt@xe_exec_threads@threads-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129781v2/bat-dg2-oem2/igt@xe_exec_threads@threads-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1232">Intel XE#1232</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-791-2b0582c5f6c84859252ce7da41fc8829c88e17a7 -&gt; xe-pw-129781v2</li>
</ul>
<p>IGT_7716: 7716<br />
  xe-791-2b0582c5f6c84859252ce7da41fc8829c88e17a7: 2b0582c5f6c84859252ce7da41fc8829c88e17a7<br />
  xe-pw-129781v2: 129781v2</p>

</body>
</html>

--===============0010900355666240691==--
