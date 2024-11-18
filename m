Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C85AD591A9
	for <intel-xe@archiver.kernel.org>; Mon, 18 Nov 2024 18:46:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55A4210E111;
	Mon, 18 Nov 2024 18:46:56 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6EDD10E111;
 Mon, 18 Nov 2024 18:46:54 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0312989710826045518=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_drm/xe=3A_Drop_useless_d3cold_al?=
 =?utf-8?q?lowed_message_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 18 Nov 2024 18:46:54 -0000
Message-ID: <173195561496.10600.15993645790193944409@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241115192155.2050987-1-matthew.brost@intel.com>
In-Reply-To: <20241115192155.2050987-1-matthew.brost@intel.com>
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

--===============0312989710826045518==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Drop useless d3cold allowed message (rev3)
URL   : https://patchwork.freedesktop.org/series/141426/
State : failure

== Summary ==

CI Bug Log - changes from xe-2247-4f08eb8dc2721d6ab0d1df079c2b2ef34f322fed_BAT -> xe-pw-141426v3_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-141426v3_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-141426v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): bat-atsm-2 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-141426v3_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_fault_mode@twice-userptr-rebind:
    - bat-lnl-2:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2247-4f08eb8dc2721d6ab0d1df079c2b2ef34f322fed/bat-lnl-2/igt@xe_exec_fault_mode@twice-userptr-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v3/bat-lnl-2/igt@xe_exec_fault_mode@twice-userptr-rebind.html

  
Known issues
------------

  Here are the changes found in xe-pw-141426v3_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:
    - bat-lnl-2:          [PASS][3] -> [DMESG-FAIL][4] ([Intel XE#3466]) +31 other tests dmesg-fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2247-4f08eb8dc2721d6ab0d1df079c2b2ef34f322fed/bat-lnl-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v3/bat-lnl-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html

  * igt@xe_exec_threads@threads-mixed-basic:
    - bat-lnl-2:          [PASS][5] -> [DMESG-WARN][6] ([Intel XE#3466]) +3 other tests dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2247-4f08eb8dc2721d6ab0d1df079c2b2ef34f322fed/bat-lnl-2/igt@xe_exec_threads@threads-mixed-basic.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v3/bat-lnl-2/igt@xe_exec_threads@threads-mixed-basic.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - bat-adlp-vf:        NOTRUN -> [SKIP][7] ([Intel XE#2229] / [Intel XE#455]) +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v3/bat-adlp-vf/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
    - bat-lnl-2:          NOTRUN -> [DMESG-FAIL][8] ([Intel XE#3466])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v3/bat-lnl-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - bat-adlp-vf:        NOTRUN -> [SKIP][9] ([Intel XE#2229])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v3/bat-adlp-vf/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  
#### Possible fixes ####

  * igt@kms_addfb_basic@bad-pitch-32:
    - bat-lnl-2:          [DMESG-WARN][10] ([Intel XE#3466]) -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2247-4f08eb8dc2721d6ab0d1df079c2b2ef34f322fed/bat-lnl-2/igt@kms_addfb_basic@bad-pitch-32.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v3/bat-lnl-2/igt@kms_addfb_basic@bad-pitch-32.html

  * igt@xe_dma_buf_sync@export-dma-buf-once-read-write-sync:
    - bat-lnl-2:          [DMESG-WARN][12] -> [PASS][13] +103 other tests pass
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2247-4f08eb8dc2721d6ab0d1df079c2b2ef34f322fed/bat-lnl-2/igt@xe_dma_buf_sync@export-dma-buf-once-read-write-sync.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v3/bat-lnl-2/igt@xe_dma_buf_sync@export-dma-buf-once-read-write-sync.html

  * igt@xe_intel_bb@intel-bb-blit-x:
    - bat-adlp-vf:        [DMESG-WARN][14] ([Intel XE#358]) -> [PASS][15] +1 other test pass
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2247-4f08eb8dc2721d6ab0d1df079c2b2ef34f322fed/bat-adlp-vf/igt@xe_intel_bb@intel-bb-blit-x.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v3/bat-adlp-vf/igt@xe_intel_bb@intel-bb-blit-x.html

  * igt@xe_live_ktest@xe_migrate:
    - bat-adlp-vf:        [SKIP][16] ([Intel XE#1192]) -> [PASS][17] +1 other test pass
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2247-4f08eb8dc2721d6ab0d1df079c2b2ef34f322fed/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v3/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html

  
#### Warnings ####

  * igt@xe_live_ktest@xe_bo:
    - bat-adlp-vf:        [SKIP][18] ([Intel XE#1192]) -> [SKIP][19] ([Intel XE#2229] / [Intel XE#455])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2247-4f08eb8dc2721d6ab0d1df079c2b2ef34f322fed/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v3/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html

  
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#3466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3466
  [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455


Build changes
-------------

  * Linux: xe-2247-4f08eb8dc2721d6ab0d1df079c2b2ef34f322fed -> xe-pw-141426v3

  IGT_8114: 8114
  xe-2247-4f08eb8dc2721d6ab0d1df079c2b2ef34f322fed: 4f08eb8dc2721d6ab0d1df079c2b2ef34f322fed
  xe-pw-141426v3: 141426v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v3/index.html

--===============0312989710826045518==
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
<tr><td><b>Series:</b></td><td>drm/xe: Drop useless d3cold allowed message (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/141426/">https://patchwork.freedesktop.org/series/141426/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2247-4f08eb8dc2721d6ab0d1df079c2b2ef34f322fed_BAT -&gt; xe-pw-141426v3_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-141426v3_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-141426v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-atsm-2 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-141426v3_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_exec_fault_mode@twice-userptr-rebind:<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2247-4f08eb8dc2721d6ab0d1df079c2b2ef34f322fed/bat-lnl-2/igt@xe_exec_fault_mode@twice-userptr-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v3/bat-lnl-2/igt@xe_exec_fault_mode@twice-userptr-rebind.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-141426v3_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2247-4f08eb8dc2721d6ab0d1df079c2b2ef34f322fed/bat-lnl-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v3/bat-lnl-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3466">Intel XE#3466</a>) +31 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-basic:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2247-4f08eb8dc2721d6ab0d1df079c2b2ef34f322fed/bat-lnl-2/igt@xe_exec_threads@threads-mixed-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v3/bat-lnl-2/igt@xe_exec_threads@threads-mixed-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3466">Intel XE#3466</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v3/bat-adlp-vf/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v3/bat-lnl-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3466">Intel XE#3466</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v3/bat-adlp-vf/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@bad-pitch-32:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2247-4f08eb8dc2721d6ab0d1df079c2b2ef34f322fed/bat-lnl-2/igt@kms_addfb_basic@bad-pitch-32.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3466">Intel XE#3466</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v3/bat-lnl-2/igt@kms_addfb_basic@bad-pitch-32.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_dma_buf_sync@export-dma-buf-once-read-write-sync:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2247-4f08eb8dc2721d6ab0d1df079c2b2ef34f322fed/bat-lnl-2/igt@xe_dma_buf_sync@export-dma-buf-once-read-write-sync.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v3/bat-lnl-2/igt@xe_dma_buf_sync@export-dma-buf-once-read-write-sync.html">PASS</a> +103 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@intel-bb-blit-x:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2247-4f08eb8dc2721d6ab0d1df079c2b2ef34f322fed/bat-adlp-vf/igt@xe_intel_bb@intel-bb-blit-x.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v3/bat-adlp-vf/igt@xe_intel_bb@intel-bb-blit-x.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2247-4f08eb8dc2721d6ab0d1df079c2b2ef34f322fed/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v3/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_live_ktest@xe_bo:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2247-4f08eb8dc2721d6ab0d1df079c2b2ef34f322fed/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141426v3/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2247-4f08eb8dc2721d6ab0d1df079c2b2ef34f322fed -&gt; xe-pw-141426v3</li>
</ul>
<p>IGT_8114: 8114<br />
  xe-2247-4f08eb8dc2721d6ab0d1df079c2b2ef34f322fed: 4f08eb8dc2721d6ab0d1df079c2b2ef34f322fed<br />
  xe-pw-141426v3: 141426v3</p>

</body>
</html>

--===============0312989710826045518==--
