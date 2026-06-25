Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A3BCCDB47F
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jun 2026 08:51:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1475410E1A0;
	Thu, 25 Jun 2026 08:51:19 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E7F110E1A0;
 Thu, 25 Jun 2026 08:51:17 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3518454402743242048=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_Revert_=22drm/i915/psr=3A_A?=
 =?utf-8?q?llow_SCL=3D0_on_platforms_with_always-on_VRR_TG=22_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 25 Jun 2026 08:51:17 -0000
Message-ID: <178237747751.116178.6747318392294391995@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260622101736.2389991-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20260622101736.2389991-1-ankit.k.nautiyal@intel.com>
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

--===============3518454402743242048==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Revert "drm/i915/psr: Allow SCL=0 on platforms with always-on VRR TG" (rev2)
URL   : https://patchwork.freedesktop.org/series/168926/
State : failure

== Summary ==

CI Bug Log - changes from xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973_BAT -> xe-pw-168926v2_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-168926v2_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-168926v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-168926v2_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind:
    - bat-bmg-3:          NOTRUN -> [INCOMPLETE][1] +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168926v2/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:
    - bat-bmg-3:          NOTRUN -> [CRASH][2] +5 other tests crash
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168926v2/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-prefetch:
    - bat-bmg-2:          [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/bat-bmg-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-prefetch.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168926v2/bat-bmg-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-prefetch.html

  
Known issues
------------

  Here are the changes found in xe-pw-168926v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - bat-bmg-3:          NOTRUN -> [INCOMPLETE][5] ([Intel XE#8439]) +2 other tests incomplete
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168926v2/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
    - bat-bmg-3:          NOTRUN -> [SKIP][6] ([Intel XE#6566]) +3 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168926v2/bat-bmg-3/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html

  
#### Possible fixes ####

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:
    - bat-bmg-3:          [CRASH][7] ([Intel XE#8438]) -> [PASS][8] +1 other test pass
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168926v2/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:
    - bat-bmg-3:          [INCOMPLETE][9] ([Intel XE#8439]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168926v2/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html

  
  [Intel XE#6566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6566
  [Intel XE#8438]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8438
  [Intel XE#8439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8439


Build changes
-------------

  * Linux: xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973 -> xe-pw-168926v2

  IGT_8985: d5fe8732b8547454c38fdd220b55f6f0cc841a3b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973: adbc617250e16fb2db4a4c777b89440927cb8973
  xe-pw-168926v2: 168926v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168926v2/index.html

--===============3518454402743242048==
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
<tr><td><b>Series:</b></td><td>Revert &quot;drm/i915/psr: Allow SCL=0 on platforms with always-on VRR TG&quot; (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/168926/">https://patchwork.freedesktop.org/series/168926/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168926v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168926v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973_BAT -&gt; xe-pw-168926v2_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-168926v2_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-168926v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-168926v2_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind:</p>
<ul>
<li>bat-bmg-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168926v2/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:</p>
<ul>
<li>bat-bmg-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168926v2/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html">CRASH</a> +5 other tests crash</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-prefetch:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/bat-bmg-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168926v2/bat-bmg-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-prefetch.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-168926v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:</p>
<ul>
<li>bat-bmg-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168926v2/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8439">Intel XE#8439</a>) +2 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>bat-bmg-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168926v2/bat-bmg-3/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6566">Intel XE#6566</a>) +3 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:</p>
<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8438">Intel XE#8438</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168926v2/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:</p>
<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8439">Intel XE#8439</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168926v2/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973 -&gt; xe-pw-168926v2</li>
</ul>
<p>IGT_8985: d5fe8732b8547454c38fdd220b55f6f0cc841a3b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5299-adbc617250e16fb2db4a4c777b89440927cb8973: adbc617250e16fb2db4a4c777b89440927cb8973<br />
  xe-pw-168926v2: 168926v2</p>

</body>
</html>

--===============3518454402743242048==--
