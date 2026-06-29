Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B90D4C43458
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jun 2026 12:55:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56C0A10E075;
	Mon, 29 Jun 2026 12:55:13 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12F0810E075;
 Mon, 29 Jun 2026 12:55:12 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5805688647221493890=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Improve_wedged_st?=
 =?utf-8?q?ate_management_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 29 Jun 2026 12:55:12 -0000
Message-ID: <178273771206.128397.13024485393703778224@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260626081955.278414-1-raag.jadav@intel.com>
In-Reply-To: <20260626081955.278414-1-raag.jadav@intel.com>
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

--===============5805688647221493890==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Improve wedged state management (rev2)
URL   : https://patchwork.freedesktop.org/series/168706/
State : success

== Summary ==

CI Bug Log - changes from xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca_BAT -> xe-pw-168706v2_BAT
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

  Here are the changes found in xe-pw-168706v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_ccs@block-copy-compressed@linear-compressed-compfmt0-vram01-vram01:
    - bat-atsm-2:         NOTRUN -> [INCOMPLETE][1] ([Intel XE#8437])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168706v2/bat-atsm-2/igt@xe_ccs@block-copy-compressed@linear-compressed-compfmt0-vram01-vram01.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap:
    - bat-bmg-3:          [PASS][2] -> [CRASH][3] ([Intel XE#8438] / [Intel XE#8482])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168706v2/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - bat-bmg-3:          NOTRUN -> [CRASH][4] ([Intel XE#8482]) +2 other tests crash
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168706v2/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind:
    - bat-bmg-3:          NOTRUN -> [INCOMPLETE][5] ([Intel XE#8479] / [Intel XE#8499]) +2 other tests incomplete
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168706v2/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:
    - bat-bmg-3:          NOTRUN -> [INCOMPLETE][6] ([Intel XE#8439] / [Intel XE#8479] / [Intel XE#8499]) +8 other tests incomplete
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168706v2/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html

  * igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
    - bat-bmg-3:          NOTRUN -> [SKIP][7] ([Intel XE#6566]) +3 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168706v2/bat-bmg-3/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html

  * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
    - bat-bmg-3:          NOTRUN -> [FAIL][8] ([Intel XE#8479])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168706v2/bat-bmg-3/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html

  
#### Possible fixes ####

  * igt@xe_ccs@block-copy-compressed@linear-compressed-compfmt0-system-vram01:
    - bat-atsm-2:         [INCOMPLETE][9] -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/bat-atsm-2/igt@xe_ccs@block-copy-compressed@linear-compressed-compfmt0-system-vram01.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168706v2/bat-atsm-2/igt@xe_ccs@block-copy-compressed@linear-compressed-compfmt0-system-vram01.html

  
#### Warnings ####

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:
    - bat-bmg-3:          [INCOMPLETE][11] ([Intel XE#8439] / [Intel XE#8479]) -> [TIMEOUT][12] ([Intel XE#8483])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168706v2/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html

  
  [Intel XE#6566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6566
  [Intel XE#8437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8437
  [Intel XE#8438]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8438
  [Intel XE#8439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8439
  [Intel XE#8479]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479
  [Intel XE#8482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8482
  [Intel XE#8483]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8483
  [Intel XE#8499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8499


Build changes
-------------

  * Linux: xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca -> xe-pw-168706v2

  IGT_8987: 8987
  xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca: 5fe805765b01f6e3519421039c3ade7cff1074ca
  xe-pw-168706v2: 168706v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168706v2/index.html

--===============5805688647221493890==
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
<tr><td><b>Series:</b></td><td>drm/xe: Improve wedged state management (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/168706/">https://patchwork.freedesktop.org/series/168706/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168706v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168706v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca_BAT -&gt; xe-pw-168706v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 11)</h2>
<p>Missing    (2): bat-lnl-2 bat-bmg-2 </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-168706v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_ccs@block-copy-compressed@linear-compressed-compfmt0-vram01-vram01:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168706v2/bat-atsm-2/igt@xe_ccs@block-copy-compressed@linear-compressed-compfmt0-vram01-vram01.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8437">Intel XE#8437</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap:</p>
<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168706v2/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8438">Intel XE#8438</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8482">Intel XE#8482</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:</p>
<ul>
<li>bat-bmg-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168706v2/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8482">Intel XE#8482</a>) +2 other tests crash</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind:</p>
<ul>
<li>bat-bmg-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168706v2/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8499">Intel XE#8499</a>) +2 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:</p>
<ul>
<li>bat-bmg-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168706v2/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8439">Intel XE#8439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8499">Intel XE#8499</a>) +8 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>bat-bmg-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168706v2/bat-bmg-3/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6566">Intel XE#6566</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:</p>
<ul>
<li>bat-bmg-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168706v2/bat-bmg-3/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_ccs@block-copy-compressed@linear-compressed-compfmt0-system-vram01:<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/bat-atsm-2/igt@xe_ccs@block-copy-compressed@linear-compressed-compfmt0-system-vram01.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168706v2/bat-atsm-2/igt@xe_ccs@block-copy-compressed@linear-compressed-compfmt0-system-vram01.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8439">Intel XE#8439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168706v2/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8483">Intel XE#8483</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca -&gt; xe-pw-168706v2</li>
</ul>
<p>IGT_8987: 8987<br />
  xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca: 5fe805765b01f6e3519421039c3ade7cff1074ca<br />
  xe-pw-168706v2: 168706v2</p>

</body>
</html>

--===============5805688647221493890==--
