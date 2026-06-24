Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDE0ACDB479
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jun 2026 22:38:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7100510E10D;
	Wed, 24 Jun 2026 22:38:41 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F05B210E0BA;
 Wed, 24 Jun 2026 22:38:40 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3887385879968607064=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/xe/vm=3A_Fix_BO_prefetc?=
 =?utf-8?q?h_with_CONSULT=5FMEM=5FADVISE=5FPREF=5FLOC_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 24 Jun 2026 22:38:40 -0000
Message-ID: <178234072094.114277.5680748415899622445@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260624174943.2808767-2-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20260624174943.2808767-2-himal.prasad.ghimiray@intel.com>
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

--===============3887385879968607064==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/vm: Fix BO prefetch with CONSULT_MEM_ADVISE_PREF_LOC (rev2)
URL   : https://patchwork.freedesktop.org/series/168913/
State : failure

== Summary ==

CI Bug Log - changes from xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded_BAT -> xe-pw-168913v2_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-168913v2_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-168913v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-168913v2_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_ccs@block-copy-compressed:
    - bat-ptl-1:          [PASS][1] -> [INCOMPLETE][2] +7 other tests incomplete
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/bat-ptl-1/igt@xe_ccs@block-copy-compressed.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/bat-ptl-1/igt@xe_ccs@block-copy-compressed.html
    - bat-lnl-1:          [PASS][3] -> [INCOMPLETE][4] +7 other tests incomplete
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/bat-lnl-1/igt@xe_ccs@block-copy-compressed.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/bat-lnl-1/igt@xe_ccs@block-copy-compressed.html

  * igt@xe_ccs@ctrl-surf-copy:
    - bat-ptl-2:          [PASS][5] -> [INCOMPLETE][6] +7 other tests incomplete
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/bat-ptl-2/igt@xe_ccs@ctrl-surf-copy.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/bat-ptl-2/igt@xe_ccs@ctrl-surf-copy.html
    - bat-wcl-1:          [PASS][7] -> [INCOMPLETE][8] +7 other tests incomplete
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/bat-wcl-1/igt@xe_ccs@ctrl-surf-copy.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/bat-wcl-1/igt@xe_ccs@ctrl-surf-copy.html

  * igt@xe_ccs@ctrl-surf-copy@linear-compressed-compfmt0-vram01-vram01:
    - bat-bmg-2:          [PASS][9] -> [INCOMPLETE][10] +7 other tests incomplete
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/bat-bmg-2/igt@xe_ccs@ctrl-surf-copy@linear-compressed-compfmt0-vram01-vram01.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/bat-bmg-2/igt@xe_ccs@ctrl-surf-copy@linear-compressed-compfmt0-vram01-vram01.html

  * igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_copy-instance-0-tile-0-vram0-memory:
    - bat-atsm-2:         [PASS][11] -> [INCOMPLETE][12] +7 other tests incomplete
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/bat-atsm-2/igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_copy-instance-0-tile-0-vram0-memory.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/bat-atsm-2/igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_copy-instance-0-tile-0-vram0-memory.html

  * igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_render-instance-0-tile-0-system-memory:
    - bat-adlp-7:         [PASS][13] -> [INCOMPLETE][14] +3 other tests incomplete
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/bat-adlp-7/igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_render-instance-0-tile-0-system-memory.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/bat-adlp-7/igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_render-instance-0-tile-0-system-memory.html

  * igt@xe_exec_atomic@basic-inc-all:
    - bat-bmg-1:          [PASS][15] -> [INCOMPLETE][16] +7 other tests incomplete
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/bat-bmg-1/igt@xe_exec_atomic@basic-inc-all.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/bat-bmg-1/igt@xe_exec_atomic@basic-inc-all.html
    - bat-lnl-2:          [PASS][17] -> [INCOMPLETE][18] +7 other tests incomplete
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/bat-lnl-2/igt@xe_exec_atomic@basic-inc-all.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/bat-lnl-2/igt@xe_exec_atomic@basic-inc-all.html

  * igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_render-instance-0-tile-0-system-memory:
    - bat-wcl-2:          [PASS][19] -> [INCOMPLETE][20] +7 other tests incomplete
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/bat-wcl-2/igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_render-instance-0-tile-0-system-memory.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/bat-wcl-2/igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_render-instance-0-tile-0-system-memory.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind:
    - bat-bmg-3:          [PASS][21] -> [INCOMPLETE][22] +6 other tests incomplete
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:
    - bat-bmg-3:          [PASS][23] -> [CRASH][24] +2 other tests crash
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind:
    - bat-bmg-3:          [PASS][25] -> [TIMEOUT][26]
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind.html

  


Build changes
-------------

  * Linux: xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded -> xe-pw-168913v2

  IGT_8985: d5fe8732b8547454c38fdd220b55f6f0cc841a3b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded: 90ab81f3633e7adc7ea9d2ef905093f10b32cded
  xe-pw-168913v2: 168913v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/index.html

--===============3887385879968607064==
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
<tr><td><b>Series:</b></td><td>drm/xe/vm: Fix BO prefetch with CONSULT_MEM_ADVISE_PREF_LOC (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/168913/">https://patchwork.freedesktop.org/series/168913/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded_BAT -&gt; xe-pw-168913v2_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-168913v2_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-168913v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-168913v2_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_ccs@block-copy-compressed:</p>
<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/bat-ptl-1/igt@xe_ccs@block-copy-compressed.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/bat-ptl-1/igt@xe_ccs@block-copy-compressed.html">INCOMPLETE</a> +7 other tests incomplete</li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/bat-lnl-1/igt@xe_ccs@block-copy-compressed.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/bat-lnl-1/igt@xe_ccs@block-copy-compressed.html">INCOMPLETE</a> +7 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@ctrl-surf-copy:</p>
<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/bat-ptl-2/igt@xe_ccs@ctrl-surf-copy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/bat-ptl-2/igt@xe_ccs@ctrl-surf-copy.html">INCOMPLETE</a> +7 other tests incomplete</li>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/bat-wcl-1/igt@xe_ccs@ctrl-surf-copy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/bat-wcl-1/igt@xe_ccs@ctrl-surf-copy.html">INCOMPLETE</a> +7 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@ctrl-surf-copy@linear-compressed-compfmt0-vram01-vram01:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/bat-bmg-2/igt@xe_ccs@ctrl-surf-copy@linear-compressed-compfmt0-vram01-vram01.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/bat-bmg-2/igt@xe_ccs@ctrl-surf-copy@linear-compressed-compfmt0-vram01-vram01.html">INCOMPLETE</a> +7 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_copy-instance-0-tile-0-vram0-memory:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/bat-atsm-2/igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_copy-instance-0-tile-0-vram0-memory.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/bat-atsm-2/igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_copy-instance-0-tile-0-vram0-memory.html">INCOMPLETE</a> +7 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_render-instance-0-tile-0-system-memory:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/bat-adlp-7/igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_render-instance-0-tile-0-system-memory.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/bat-adlp-7/igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_render-instance-0-tile-0-system-memory.html">INCOMPLETE</a> +3 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-inc-all:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/bat-bmg-1/igt@xe_exec_atomic@basic-inc-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/bat-bmg-1/igt@xe_exec_atomic@basic-inc-all.html">INCOMPLETE</a> +7 other tests incomplete</li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/bat-lnl-2/igt@xe_exec_atomic@basic-inc-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/bat-lnl-2/igt@xe_exec_atomic@basic-inc-all.html">INCOMPLETE</a> +7 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_render-instance-0-tile-0-system-memory:</p>
<ul>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/bat-wcl-2/igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_render-instance-0-tile-0-system-memory.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/bat-wcl-2/igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_render-instance-0-tile-0-system-memory.html">INCOMPLETE</a> +7 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind:</p>
<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind.html">INCOMPLETE</a> +6 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:</p>
<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html">CRASH</a> +2 other tests crash</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind:</p>
<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168913v2/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind.html">TIMEOUT</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded -&gt; xe-pw-168913v2</li>
</ul>
<p>IGT_8985: d5fe8732b8547454c38fdd220b55f6f0cc841a3b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5297-90ab81f3633e7adc7ea9d2ef905093f10b32cded: 90ab81f3633e7adc7ea9d2ef905093f10b32cded<br />
  xe-pw-168913v2: 168913v2</p>

</body>
</html>

--===============3887385879968607064==--
