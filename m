Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A918DC43327
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jun 2026 12:12:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5661E10E859;
	Mon, 29 Jun 2026 12:12:18 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBE4310E84F;
 Mon, 29 Jun 2026 12:12:16 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4406786053308266501=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/ttm=3A_Account_for_NULL?=
 =?utf-8?q?_pages_in_ttm=5Fpool=5Fbackup?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 29 Jun 2026 12:12:16 -0000
Message-ID: <178273513689.127657.5132447205276528761@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260626074653.1326683-1-matthew.brost@intel.com>
In-Reply-To: <20260626074653.1326683-1-matthew.brost@intel.com>
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

--===============4406786053308266501==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/ttm: Account for NULL pages in ttm_pool_backup
URL   : https://patchwork.freedesktop.org/series/169242/
State : success

== Summary ==

CI Bug Log - changes from xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca_BAT -> xe-pw-169242v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 11)
------------------------------

  Missing    (2): bat-lnl-2 bat-bmg-2 

Known issues
------------

  Here are the changes found in xe-pw-169242v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_ccs@block-copy-compressed@linear-compressed-compfmt0-vram01-vram01:
    - bat-atsm-2:         NOTRUN -> [INCOMPLETE][1] ([Intel XE#8437])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/bat-atsm-2/igt@xe_ccs@block-copy-compressed@linear-compressed-compfmt0-vram01-vram01.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind:
    - bat-bmg-3:          NOTRUN -> [INCOMPLETE][2] ([Intel XE#8479] / [Intel XE#8499]) +1 other test incomplete
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:
    - bat-bmg-3:          NOTRUN -> [INCOMPLETE][3] ([Intel XE#8439] / [Intel XE#8479] / [Intel XE#8499]) +1 other test incomplete
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind:
    - bat-bmg-3:          NOTRUN -> [CRASH][4] ([Intel XE#8482])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind.html

  
#### Possible fixes ####

  * igt@xe_ccs@block-copy-compressed@linear-compressed-compfmt0-system-vram01:
    - bat-atsm-2:         [INCOMPLETE][5] -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/bat-atsm-2/igt@xe_ccs@block-copy-compressed@linear-compressed-compfmt0-system-vram01.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/bat-atsm-2/igt@xe_ccs@block-copy-compressed@linear-compressed-compfmt0-system-vram01.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:
    - bat-bmg-3:          [INCOMPLETE][7] ([Intel XE#8439] / [Intel XE#8479]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html

  
  [Intel XE#8437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8437
  [Intel XE#8439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8439
  [Intel XE#8479]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479
  [Intel XE#8482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8482
  [Intel XE#8499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8499


Build changes
-------------

  * Linux: xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca -> xe-pw-169242v1

  IGT_8987: 8987
  xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca: 5fe805765b01f6e3519421039c3ade7cff1074ca
  xe-pw-169242v1: 169242v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/index.html

--===============4406786053308266501==
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
<tr><td><b>Series:</b></td><td>drm/ttm: Account for NULL pages in ttm_pool_backup</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/169242/">https://patchwork.freedesktop.org/series/169242/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca_BAT -&gt; xe-pw-169242v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 11)</h2>
<p>Missing    (2): bat-lnl-2 bat-bmg-2 </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-169242v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_ccs@block-copy-compressed@linear-compressed-compfmt0-vram01-vram01:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/bat-atsm-2/igt@xe_ccs@block-copy-compressed@linear-compressed-compfmt0-vram01-vram01.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8437">Intel XE#8437</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind:</p>
<ul>
<li>bat-bmg-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8499">Intel XE#8499</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:</p>
<ul>
<li>bat-bmg-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8439">Intel XE#8439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8499">Intel XE#8499</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind:</p>
<ul>
<li>bat-bmg-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8482">Intel XE#8482</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@xe_ccs@block-copy-compressed@linear-compressed-compfmt0-system-vram01:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/bat-atsm-2/igt@xe_ccs@block-copy-compressed@linear-compressed-compfmt0-system-vram01.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/bat-atsm-2/igt@xe_ccs@block-copy-compressed@linear-compressed-compfmt0-system-vram01.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:</p>
<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8439">Intel XE#8439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca -&gt; xe-pw-169242v1</li>
</ul>
<p>IGT_8987: 8987<br />
  xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca: 5fe805765b01f6e3519421039c3ade7cff1074ca<br />
  xe-pw-169242v1: 169242v1</p>

</body>
</html>

--===============4406786053308266501==--
