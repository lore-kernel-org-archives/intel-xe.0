Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBD70CDE00C
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jun 2026 22:37:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FBDB10F3A8;
	Thu, 25 Jun 2026 22:37:58 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAF0610F3A8;
 Thu, 25 Jun 2026 22:37:57 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1373804926797904223=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/xe/userptr=3A_Hold_noti?=
 =?utf-8?q?fier=5Flock_for_write_on_inject_test_path?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shuicheng Lin" <shuicheng.lin@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 25 Jun 2026 22:37:57 -0000
Message-ID: <178242707782.118588.3117097438828708628@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260625215615.3016892-1-shuicheng.lin@intel.com>
In-Reply-To: <20260625215615.3016892-1-shuicheng.lin@intel.com>
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

--===============1373804926797904223==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/userptr: Hold notifier_lock for write on inject test path
URL   : https://patchwork.freedesktop.org/series/169222/
State : failure

== Summary ==

CI Bug Log - changes from xe-5302-18cd20781ea0de17268c35faf4a2b53b593915c2_BAT -> xe-pw-169222v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-169222v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-169222v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-169222v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:
    - bat-bmg-2:          [PASS][1] -> [TIMEOUT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5302-18cd20781ea0de17268c35faf4a2b53b593915c2/bat-bmg-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169222v1/bat-bmg-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html

  
Known issues
------------

  Here are the changes found in xe-pw-169222v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_ccs@ctrl-surf-copy@linear-compressed-compfmt0-vram01-vram01:
    - bat-atsm-2:         NOTRUN -> [INCOMPLETE][3] ([Intel XE#8437])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169222v1/bat-atsm-2/igt@xe_ccs@ctrl-surf-copy@linear-compressed-compfmt0-vram01-vram01.html

  * igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_render-instance-0-tile-0-vram0-memory:
    - bat-atsm-2:         [PASS][4] -> [INCOMPLETE][5] ([Intel XE#8437])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5302-18cd20781ea0de17268c35faf4a2b53b593915c2/bat-atsm-2/igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_render-instance-0-tile-0-vram0-memory.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169222v1/bat-atsm-2/igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_render-instance-0-tile-0-vram0-memory.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:
    - bat-bmg-3:          NOTRUN -> [CRASH][6] ([Intel XE#8438] / [Intel XE#8482])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169222v1/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - bat-bmg-3:          NOTRUN -> [INCOMPLETE][7] ([Intel XE#8439] / [Intel XE#8479]) +6 other tests incomplete
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169222v1/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind:
    - bat-bmg-3:          NOTRUN -> [INCOMPLETE][8] ([Intel XE#8479]) +1 other test incomplete
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169222v1/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:
    - bat-bmg-3:          NOTRUN -> [CRASH][9] ([Intel XE#8482]) +3 other tests crash
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169222v1/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:
    - bat-bmg-3:          NOTRUN -> [TIMEOUT][10] ([Intel XE#8483])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169222v1/bat-bmg-3/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html

  * igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
    - bat-bmg-3:          NOTRUN -> [SKIP][11] ([Intel XE#6566]) +3 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169222v1/bat-bmg-3/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html

  * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
    - bat-bmg-3:          NOTRUN -> [FAIL][12] ([Intel XE#8479])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169222v1/bat-bmg-3/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html

  
#### Possible fixes ####

  * igt@xe_ccs@block-copy-compressed:
    - bat-bmg-2:          [INCOMPLETE][13] ([Intel XE#8437] / [Intel XE#8479]) -> [PASS][14] +1 other test pass
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5302-18cd20781ea0de17268c35faf4a2b53b593915c2/bat-bmg-2/igt@xe_ccs@block-copy-compressed.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169222v1/bat-bmg-2/igt@xe_ccs@block-copy-compressed.html

  * igt@xe_ccs@ctrl-surf-copy@linear-compressed-compfmt0-system-vram01:
    - bat-atsm-2:         [INCOMPLETE][15] -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5302-18cd20781ea0de17268c35faf4a2b53b593915c2/bat-atsm-2/igt@xe_ccs@ctrl-surf-copy@linear-compressed-compfmt0-system-vram01.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169222v1/bat-atsm-2/igt@xe_ccs@ctrl-surf-copy@linear-compressed-compfmt0-system-vram01.html

  * igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_render-instance-0-tile-0-vram0-memory:
    - bat-bmg-2:          [FAIL][17] ([Intel XE#8474]) -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5302-18cd20781ea0de17268c35faf4a2b53b593915c2/bat-bmg-2/igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_render-instance-0-tile-0-vram0-memory.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169222v1/bat-bmg-2/igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_render-instance-0-tile-0-vram0-memory.html

  
#### Warnings ####

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap:
    - bat-bmg-3:          [INCOMPLETE][19] ([Intel XE#8439] / [Intel XE#8479]) -> [CRASH][20] ([Intel XE#8438] / [Intel XE#8482])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5302-18cd20781ea0de17268c35faf4a2b53b593915c2/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169222v1/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html

  
  [Intel XE#6566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6566
  [Intel XE#8437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8437
  [Intel XE#8438]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8438
  [Intel XE#8439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8439
  [Intel XE#8474]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8474
  [Intel XE#8479]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479
  [Intel XE#8482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8482
  [Intel XE#8483]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8483


Build changes
-------------

  * IGT: IGT_8986 -> IGT_8987
  * Linux: xe-5302-18cd20781ea0de17268c35faf4a2b53b593915c2 -> xe-pw-169222v1

  IGT_8986: 8986
  IGT_8987: 8987
  xe-5302-18cd20781ea0de17268c35faf4a2b53b593915c2: 18cd20781ea0de17268c35faf4a2b53b593915c2
  xe-pw-169222v1: 169222v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169222v1/index.html

--===============1373804926797904223==
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
<tr><td><b>Series:</b></td><td>drm/xe/userptr: Hold notifier_lock for write on inject test path</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/169222/">https://patchwork.freedesktop.org/series/169222/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169222v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169222v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5302-18cd20781ea0de17268c35faf4a2b53b593915c2_BAT -&gt; xe-pw-169222v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-169222v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-169222v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-169222v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5302-18cd20781ea0de17268c35faf4a2b53b593915c2/bat-bmg-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169222v1/bat-bmg-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html">TIMEOUT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-169222v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_ccs@ctrl-surf-copy@linear-compressed-compfmt0-vram01-vram01:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169222v1/bat-atsm-2/igt@xe_ccs@ctrl-surf-copy@linear-compressed-compfmt0-vram01-vram01.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8437">Intel XE#8437</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_render-instance-0-tile-0-vram0-memory:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5302-18cd20781ea0de17268c35faf4a2b53b593915c2/bat-atsm-2/igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_render-instance-0-tile-0-vram0-memory.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169222v1/bat-atsm-2/igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_render-instance-0-tile-0-vram0-memory.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8437">Intel XE#8437</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:</p>
<ul>
<li>bat-bmg-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169222v1/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8438">Intel XE#8438</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8482">Intel XE#8482</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:</p>
<ul>
<li>bat-bmg-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169222v1/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8439">Intel XE#8439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) +6 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind:</p>
<ul>
<li>bat-bmg-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169222v1/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:</p>
<ul>
<li>bat-bmg-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169222v1/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8482">Intel XE#8482</a>) +3 other tests crash</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:</p>
<ul>
<li>bat-bmg-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169222v1/bat-bmg-3/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8483">Intel XE#8483</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>bat-bmg-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169222v1/bat-bmg-3/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6566">Intel XE#6566</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:</p>
<ul>
<li>bat-bmg-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169222v1/bat-bmg-3/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@xe_ccs@block-copy-compressed:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5302-18cd20781ea0de17268c35faf4a2b53b593915c2/bat-bmg-2/igt@xe_ccs@block-copy-compressed.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8437">Intel XE#8437</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169222v1/bat-bmg-2/igt@xe_ccs@block-copy-compressed.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@ctrl-surf-copy@linear-compressed-compfmt0-system-vram01:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5302-18cd20781ea0de17268c35faf4a2b53b593915c2/bat-atsm-2/igt@xe_ccs@ctrl-surf-copy@linear-compressed-compfmt0-system-vram01.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169222v1/bat-atsm-2/igt@xe_ccs@ctrl-surf-copy@linear-compressed-compfmt0-system-vram01.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_render-instance-0-tile-0-vram0-memory:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5302-18cd20781ea0de17268c35faf4a2b53b593915c2/bat-bmg-2/igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_render-instance-0-tile-0-vram0-memory.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8474">Intel XE#8474</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169222v1/bat-bmg-2/igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_render-instance-0-tile-0-vram0-memory.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap:<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5302-18cd20781ea0de17268c35faf4a2b53b593915c2/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8439">Intel XE#8439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169222v1/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8438">Intel XE#8438</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8482">Intel XE#8482</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8986 -&gt; IGT_8987</li>
<li>Linux: xe-5302-18cd20781ea0de17268c35faf4a2b53b593915c2 -&gt; xe-pw-169222v1</li>
</ul>
<p>IGT_8986: 8986<br />
  IGT_8987: 8987<br />
  xe-5302-18cd20781ea0de17268c35faf4a2b53b593915c2: 18cd20781ea0de17268c35faf4a2b53b593915c2<br />
  xe-pw-169222v1: 169222v1</p>

</body>
</html>

--===============1373804926797904223==--
