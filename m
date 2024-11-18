Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 698A1D591AA
	for <intel-xe@archiver.kernel.org>; Mon, 18 Nov 2024 17:43:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 295F110E270;
	Mon, 18 Nov 2024 17:43:12 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA97810E270;
 Mon, 18 Nov 2024 17:43:10 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7558413854768011323=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/dp=3A_extract_payload_helper?=
 =?utf-8?q?s?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 18 Nov 2024 17:43:10 -0000
Message-ID: <173195179071.1280790.4979677049294569012@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <cover.1731942780.git.jani.nikula@intel.com>
In-Reply-To: <cover.1731942780.git.jani.nikula@intel.com>
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

--===============7558413854768011323==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/dp: extract payload helpers
URL   : https://patchwork.freedesktop.org/series/141503/
State : success

== Summary ==

CI Bug Log - changes from xe-2247-4f08eb8dc2721d6ab0d1df079c2b2ef34f322fed_BAT -> xe-pw-141503v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-141503v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [PASS][1] -> [DMESG-WARN][2] ([Intel XE#1033])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2247-4f08eb8dc2721d6ab0d1df079c2b2ef34f322fed/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141503v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:
    - bat-lnl-2:          [PASS][3] -> [DMESG-FAIL][4] ([Intel XE#3466]) +32 other tests dmesg-fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2247-4f08eb8dc2721d6ab0d1df079c2b2ef34f322fed/bat-lnl-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141503v1/bat-lnl-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html

  * igt@xe_exec_threads@threads-mixed-basic:
    - bat-lnl-2:          [PASS][5] -> [DMESG-WARN][6] ([Intel XE#3466]) +3 other tests dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2247-4f08eb8dc2721d6ab0d1df079c2b2ef34f322fed/bat-lnl-2/igt@xe_exec_threads@threads-mixed-basic.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141503v1/bat-lnl-2/igt@xe_exec_threads@threads-mixed-basic.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - bat-adlp-vf:        NOTRUN -> [SKIP][7] ([Intel XE#2229] / [Intel XE#455]) +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141503v1/bat-adlp-vf/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
    - bat-lnl-2:          NOTRUN -> [DMESG-FAIL][8] ([Intel XE#3466])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141503v1/bat-lnl-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - bat-adlp-vf:        NOTRUN -> [SKIP][9] ([Intel XE#2229])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141503v1/bat-adlp-vf/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  
#### Possible fixes ####

  * igt@kms_addfb_basic@bad-pitch-32:
    - bat-lnl-2:          [DMESG-WARN][10] ([Intel XE#3466]) -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2247-4f08eb8dc2721d6ab0d1df079c2b2ef34f322fed/bat-lnl-2/igt@kms_addfb_basic@bad-pitch-32.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141503v1/bat-lnl-2/igt@kms_addfb_basic@bad-pitch-32.html

  * igt@xe_dma_buf_sync@export-dma-buf-once-read-write-sync:
    - bat-lnl-2:          [DMESG-WARN][12] -> [PASS][13] +103 other tests pass
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2247-4f08eb8dc2721d6ab0d1df079c2b2ef34f322fed/bat-lnl-2/igt@xe_dma_buf_sync@export-dma-buf-once-read-write-sync.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141503v1/bat-lnl-2/igt@xe_dma_buf_sync@export-dma-buf-once-read-write-sync.html

  * igt@xe_intel_bb@intel-bb-blit-x:
    - bat-adlp-vf:        [DMESG-WARN][14] ([Intel XE#358]) -> [PASS][15] +1 other test pass
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2247-4f08eb8dc2721d6ab0d1df079c2b2ef34f322fed/bat-adlp-vf/igt@xe_intel_bb@intel-bb-blit-x.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141503v1/bat-adlp-vf/igt@xe_intel_bb@intel-bb-blit-x.html

  * igt@xe_live_ktest@xe_migrate:
    - bat-adlp-vf:        [SKIP][16] ([Intel XE#1192]) -> [PASS][17] +1 other test pass
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2247-4f08eb8dc2721d6ab0d1df079c2b2ef34f322fed/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141503v1/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html

  
#### Warnings ####

  * igt@xe_live_ktest@xe_bo:
    - bat-adlp-vf:        [SKIP][18] ([Intel XE#1192]) -> [SKIP][19] ([Intel XE#2229] / [Intel XE#455])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2247-4f08eb8dc2721d6ab0d1df079c2b2ef34f322fed/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141503v1/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html

  
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#3466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3466
  [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455


Build changes
-------------

  * Linux: xe-2247-4f08eb8dc2721d6ab0d1df079c2b2ef34f322fed -> xe-pw-141503v1

  IGT_8114: 8114
  xe-2247-4f08eb8dc2721d6ab0d1df079c2b2ef34f322fed: 4f08eb8dc2721d6ab0d1df079c2b2ef34f322fed
  xe-pw-141503v1: 141503v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141503v1/index.html

--===============7558413854768011323==
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
<tr><td><b>Series:</b></td><td>drm/dp: extract payload helpers</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/141503/">https://patchwork.freedesktop.org/series/141503/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141503v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141503v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2247-4f08eb8dc2721d6ab0d1df079c2b2ef34f322fed_BAT -&gt; xe-pw-141503v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-141503v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2247-4f08eb8dc2721d6ab0d1df079c2b2ef34f322fed/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141503v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2247-4f08eb8dc2721d6ab0d1df079c2b2ef34f322fed/bat-lnl-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141503v1/bat-lnl-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3466">Intel XE#3466</a>) +32 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-basic:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2247-4f08eb8dc2721d6ab0d1df079c2b2ef34f322fed/bat-lnl-2/igt@xe_exec_threads@threads-mixed-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141503v1/bat-lnl-2/igt@xe_exec_threads@threads-mixed-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3466">Intel XE#3466</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141503v1/bat-adlp-vf/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141503v1/bat-lnl-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3466">Intel XE#3466</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141503v1/bat-adlp-vf/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@bad-pitch-32:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2247-4f08eb8dc2721d6ab0d1df079c2b2ef34f322fed/bat-lnl-2/igt@kms_addfb_basic@bad-pitch-32.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3466">Intel XE#3466</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141503v1/bat-lnl-2/igt@kms_addfb_basic@bad-pitch-32.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_dma_buf_sync@export-dma-buf-once-read-write-sync:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2247-4f08eb8dc2721d6ab0d1df079c2b2ef34f322fed/bat-lnl-2/igt@xe_dma_buf_sync@export-dma-buf-once-read-write-sync.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141503v1/bat-lnl-2/igt@xe_dma_buf_sync@export-dma-buf-once-read-write-sync.html">PASS</a> +103 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@intel-bb-blit-x:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2247-4f08eb8dc2721d6ab0d1df079c2b2ef34f322fed/bat-adlp-vf/igt@xe_intel_bb@intel-bb-blit-x.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141503v1/bat-adlp-vf/igt@xe_intel_bb@intel-bb-blit-x.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2247-4f08eb8dc2721d6ab0d1df079c2b2ef34f322fed/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141503v1/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_live_ktest@xe_bo:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2247-4f08eb8dc2721d6ab0d1df079c2b2ef34f322fed/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141503v1/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2247-4f08eb8dc2721d6ab0d1df079c2b2ef34f322fed -&gt; xe-pw-141503v1</li>
</ul>
<p>IGT_8114: 8114<br />
  xe-2247-4f08eb8dc2721d6ab0d1df079c2b2ef34f322fed: 4f08eb8dc2721d6ab0d1df079c2b2ef34f322fed<br />
  xe-pw-141503v1: 141503v1</p>

</body>
</html>

--===============7558413854768011323==--
