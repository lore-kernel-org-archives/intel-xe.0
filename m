Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 464EECDE000
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jun 2026 13:59:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01C2810F2D4;
	Thu, 25 Jun 2026 13:59:28 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4337D10F2C8;
 Thu, 25 Jun 2026 13:59:26 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6649660389280471678=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/i915/vrr=3A_require_val?=
 =?utf-8?q?id_min/max_vfreq_for_VRR?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 25 Jun 2026 13:59:26 -0000
Message-ID: <178239596626.117741.18178429433137082188@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260625131040.1051272-1-jani.nikula@intel.com>
In-Reply-To: <20260625131040.1051272-1-jani.nikula@intel.com>
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

--===============6649660389280471678==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/vrr: require valid min/max vfreq for VRR
URL   : https://patchwork.freedesktop.org/series/169197/
State : failure

== Summary ==

CI Bug Log - changes from xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973_BAT -> xe-pw-169197v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-169197v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-169197v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (13 -> 12)
------------------------------

  Missing    (1): bat-lnl-2 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-169197v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:
    - bat-bmg-3:          NOTRUN -> [TIMEOUT][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169197v1/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:
    - bat-bmg-3:          NOTRUN -> [CRASH][2] +4 other tests crash
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169197v1/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html

  
Known issues
------------

  Here are the changes found in xe-pw-169197v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - bat-bmg-3:          NOTRUN -> [INCOMPLETE][3] ([Intel XE#8439] / [Intel XE#8479]) +4 other tests incomplete
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169197v1/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind:
    - bat-bmg-3:          NOTRUN -> [INCOMPLETE][4] ([Intel XE#8479]) +1 other test incomplete
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169197v1/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr:
    - bat-bmg-3:          [PASS][5] -> [INCOMPLETE][6] ([Intel XE#8479])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169197v1/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr.html

  * igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
    - bat-bmg-3:          NOTRUN -> [SKIP][7] ([Intel XE#6566]) +3 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169197v1/bat-bmg-3/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html

  
#### Warnings ####

  * igt@xe_ccs@block-copy-compressed:
    - bat-ptl-1:          [INCOMPLETE][8] ([Intel XE#8437]) -> [INCOMPLETE][9] ([Intel XE#8437] / [Intel XE#8479]) +7 other tests incomplete
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/bat-ptl-1/igt@xe_ccs@block-copy-compressed.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169197v1/bat-ptl-1/igt@xe_ccs@block-copy-compressed.html
    - bat-lnl-1:          [INCOMPLETE][10] ([Intel XE#8437]) -> [INCOMPLETE][11] ([Intel XE#8437] / [Intel XE#8479]) +7 other tests incomplete
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/bat-lnl-1/igt@xe_ccs@block-copy-compressed.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169197v1/bat-lnl-1/igt@xe_ccs@block-copy-compressed.html

  * igt@xe_ccs@ctrl-surf-copy:
    - bat-ptl-2:          [INCOMPLETE][12] ([Intel XE#8437]) -> [INCOMPLETE][13] ([Intel XE#8437] / [Intel XE#8479]) +7 other tests incomplete
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/bat-ptl-2/igt@xe_ccs@ctrl-surf-copy.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169197v1/bat-ptl-2/igt@xe_ccs@ctrl-surf-copy.html
    - bat-wcl-1:          [INCOMPLETE][14] ([Intel XE#8437]) -> [INCOMPLETE][15] ([Intel XE#8437] / [Intel XE#8479]) +7 other tests incomplete
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/bat-wcl-1/igt@xe_ccs@ctrl-surf-copy.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169197v1/bat-wcl-1/igt@xe_ccs@ctrl-surf-copy.html

  * igt@xe_ccs@ctrl-surf-copy@linear-compressed-compfmt0-vram01-vram01:
    - bat-bmg-2:          [INCOMPLETE][16] ([Intel XE#8437]) -> [INCOMPLETE][17] ([Intel XE#8437] / [Intel XE#8479]) +7 other tests incomplete
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/bat-bmg-2/igt@xe_ccs@ctrl-surf-copy@linear-compressed-compfmt0-vram01-vram01.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169197v1/bat-bmg-2/igt@xe_ccs@ctrl-surf-copy@linear-compressed-compfmt0-vram01-vram01.html

  * igt@xe_exec_atomic@basic-inc-all:
    - bat-bmg-1:          [INCOMPLETE][18] ([Intel XE#8437]) -> [INCOMPLETE][19] ([Intel XE#8437] / [Intel XE#8479]) +7 other tests incomplete
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/bat-bmg-1/igt@xe_exec_atomic@basic-inc-all.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169197v1/bat-bmg-1/igt@xe_exec_atomic@basic-inc-all.html

  * igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_render-instance-0-tile-0-system-memory:
    - bat-wcl-2:          [INCOMPLETE][20] ([Intel XE#8437]) -> [INCOMPLETE][21] ([Intel XE#8437] / [Intel XE#8479]) +7 other tests incomplete
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/bat-wcl-2/igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_render-instance-0-tile-0-system-memory.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169197v1/bat-wcl-2/igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_render-instance-0-tile-0-system-memory.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:
    - bat-bmg-3:          [CRASH][22] ([Intel XE#8438]) -> [INCOMPLETE][23] ([Intel XE#8439] / [Intel XE#8479])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169197v1/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:
    - bat-bmg-3:          [INCOMPLETE][24] ([Intel XE#8439]) -> [INCOMPLETE][25] ([Intel XE#8439] / [Intel XE#8479])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169197v1/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html

  
  [Intel XE#6566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6566
  [Intel XE#8437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8437
  [Intel XE#8438]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8438
  [Intel XE#8439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8439
  [Intel XE#8479]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479


Build changes
-------------

  * IGT: IGT_8985 -> IGT_8986
  * Linux: xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973 -> xe-pw-169197v1

  IGT_8985: d5fe8732b8547454c38fdd220b55f6f0cc841a3b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8986: 8986
  xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973: adbc617250e16fb2db4a4c777b89440927cb8973
  xe-pw-169197v1: 169197v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169197v1/index.html

--===============6649660389280471678==
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
<tr><td><b>Series:</b></td><td>drm/i915/vrr: require valid min/max vfreq for VRR</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/169197/">https://patchwork.freedesktop.org/series/169197/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169197v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169197v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973_BAT -&gt; xe-pw-169197v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-169197v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-169197v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (13 -&gt; 12)</h2>
<p>Missing    (1): bat-lnl-2 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-169197v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:</p>
<ul>
<li>bat-bmg-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169197v1/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html">TIMEOUT</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:</p>
<ul>
<li>bat-bmg-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169197v1/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html">CRASH</a> +4 other tests crash</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-169197v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:</p>
<ul>
<li>bat-bmg-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169197v1/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8439">Intel XE#8439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) +4 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind:</p>
<ul>
<li>bat-bmg-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169197v1/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr:</p>
<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169197v1/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>bat-bmg-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169197v1/bat-bmg-3/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6566">Intel XE#6566</a>) +3 other tests skip</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@xe_ccs@block-copy-compressed:</p>
<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/bat-ptl-1/igt@xe_ccs@block-copy-compressed.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8437">Intel XE#8437</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169197v1/bat-ptl-1/igt@xe_ccs@block-copy-compressed.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8437">Intel XE#8437</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) +7 other tests incomplete</li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/bat-lnl-1/igt@xe_ccs@block-copy-compressed.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8437">Intel XE#8437</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169197v1/bat-lnl-1/igt@xe_ccs@block-copy-compressed.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8437">Intel XE#8437</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) +7 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@ctrl-surf-copy:</p>
<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/bat-ptl-2/igt@xe_ccs@ctrl-surf-copy.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8437">Intel XE#8437</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169197v1/bat-ptl-2/igt@xe_ccs@ctrl-surf-copy.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8437">Intel XE#8437</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) +7 other tests incomplete</li>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/bat-wcl-1/igt@xe_ccs@ctrl-surf-copy.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8437">Intel XE#8437</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169197v1/bat-wcl-1/igt@xe_ccs@ctrl-surf-copy.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8437">Intel XE#8437</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) +7 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@ctrl-surf-copy@linear-compressed-compfmt0-vram01-vram01:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/bat-bmg-2/igt@xe_ccs@ctrl-surf-copy@linear-compressed-compfmt0-vram01-vram01.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8437">Intel XE#8437</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169197v1/bat-bmg-2/igt@xe_ccs@ctrl-surf-copy@linear-compressed-compfmt0-vram01-vram01.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8437">Intel XE#8437</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) +7 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-inc-all:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/bat-bmg-1/igt@xe_exec_atomic@basic-inc-all.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8437">Intel XE#8437</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169197v1/bat-bmg-1/igt@xe_exec_atomic@basic-inc-all.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8437">Intel XE#8437</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) +7 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_render-instance-0-tile-0-system-memory:</p>
<ul>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/bat-wcl-2/igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_render-instance-0-tile-0-system-memory.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8437">Intel XE#8437</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169197v1/bat-wcl-2/igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_render-instance-0-tile-0-system-memory.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8437">Intel XE#8437</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) +7 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:</p>
<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8438">Intel XE#8438</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169197v1/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8439">Intel XE#8439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:</p>
<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8439">Intel XE#8439</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169197v1/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8439">Intel XE#8439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8985 -&gt; IGT_8986</li>
<li>Linux: xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973 -&gt; xe-pw-169197v1</li>
</ul>
<p>IGT_8985: d5fe8732b8547454c38fdd220b55f6f0cc841a3b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8986: 8986<br />
  xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973: adbc617250e16fb2db4a4c777b89440927cb8973<br />
  xe-pw-169197v1: 169197v1</p>

</body>
</html>

--===============6649660389280471678==--
