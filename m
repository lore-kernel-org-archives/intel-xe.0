Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 805DFC4345F
	for <intel-xe@archiver.kernel.org>; Wed, 24 Apr 2024 15:39:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C1FF10F06B;
	Wed, 24 Apr 2024 15:39:50 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2F9210F06B;
 Wed, 24 Apr 2024 15:39:48 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4883350960917414397=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_series_starting_with_=5BCI=2C1/3?=
 =?utf-8?q?=5D_drm/xe=3A_Store_xe=5Fhw=5Fengine_in_xe=5Fhw=5Fengine=5Fsnapsh?=
 =?utf-8?q?ot?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Souza, Jose" <jose.souza@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 24 Apr 2024 15:39:48 -0000
Message-ID: <171397318899.1631669.12677571073358249535@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240424140319.61651-1-jose.souza@intel.com>
In-Reply-To: <20240424140319.61651-1-jose.souza@intel.com>
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

--===============4883350960917414397==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [CI,1/3] drm/xe: Store xe_hw_engine in xe_hw_engine_snapshot
URL   : https://patchwork.freedesktop.org/series/132848/
State : failure

== Summary ==

CI Bug Log - changes from xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00_BAT -> xe-pw-132848v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-132848v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-132848v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-132848v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-imm (NEW):
    - bat-atsm-2:         NOTRUN -> [SKIP][1] +4 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html
    - bat-adlp-7:         NOTRUN -> [SKIP][2] +4 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm (NEW):
    - bat-dg2-oem2:       NOTRUN -> [SKIP][3] +4 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html

  
New tests
---------

  New tests have been introduced between xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00_BAT and xe-pw-132848v1_BAT:

### New IGT tests (5) ###

  * igt@xe_exec_fault_mode@twice-basic-imm:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@xe_exec_fault_mode@twice-rebind-imm:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 0.03] s

  * igt@xe_exec_fault_mode@twice-userptr-imm:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 0.02] s

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 0.04] s

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
    - Statuses : 2 pass(s) 3 skip(s)
    - Exec time: [0.0, 0.03] s

  

Known issues
------------

  Here are the changes found in xe-pw-132848v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-imm:
    - bat-adlp-7:         NOTRUN -> [SKIP][4] ([Intel XE#288]) +4 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/bat-adlp-7/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-imm.html
    - bat-dg2-oem2:       NOTRUN -> [SKIP][5] ([Intel XE#288]) +4 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-imm.html
    - bat-atsm-2:         NOTRUN -> [SKIP][6] ([Intel XE#288]) +4 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/bat-atsm-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-imm.html

  
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288


Build changes
-------------

  * IGT: IGT_7820 -> IGT_7821
  * Linux: xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00 -> xe-pw-132848v1

  IGT_7820: 741ef547cbf5d8fcc144f1bb048844c33bca7509 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7821: fffcce4ac88b1c4e68825d564515470e72d2c40f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00: d28c0a7e868367b2d1d9ab3f80dcd0380de92a00
  xe-pw-132848v1: 132848v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/index.html

--===============4883350960917414397==
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
<tr><td><b>Series:</b></td><td>series starting with [CI,1/3] drm/xe: Store xe_hw_engine in xe_hw_engine_snapshot</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/132848/">https://patchwork.freedesktop.org/series/132848/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00_BAT -&gt; xe-pw-132848v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-132848v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-132848v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-132848v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-imm (NEW):</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html">SKIP</a> +4 other tests skip</li>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-imm (NEW):</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00_BAT and xe-pw-132848v1_BAT:</p>
<h3>New IGT tests (5)</h3>
<ul>
<li>
<p>igt@xe_exec_fault_mode@twice-basic-imm:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-rebind-imm:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-imm:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-imm:</p>
<ul>
<li>Statuses : 2 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 0.03] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-132848v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-imm:<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/bat-adlp-7/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +4 other tests skip</li>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +4 other tests skip</li>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132848v1/bat-atsm-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +4 other tests skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7820 -&gt; IGT_7821</li>
<li>Linux: xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00 -&gt; xe-pw-132848v1</li>
</ul>
<p>IGT_7820: 741ef547cbf5d8fcc144f1bb048844c33bca7509 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7821: fffcce4ac88b1c4e68825d564515470e72d2c40f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1169-d28c0a7e868367b2d1d9ab3f80dcd0380de92a00: d28c0a7e868367b2d1d9ab3f80dcd0380de92a00<br />
  xe-pw-132848v1: 132848v1</p>

</body>
</html>

--===============4883350960917414397==--
