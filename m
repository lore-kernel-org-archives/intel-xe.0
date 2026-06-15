Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B262ACD98C5
	for <intel-xe@archiver.kernel.org>; Mon, 15 Jun 2026 04:47:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 636CD10E1C0;
	Mon, 15 Jun 2026 04:47:12 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 709DD10E18D;
 Mon, 15 Jun 2026 04:47:10 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5134857590078061055=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/xe=3A_make_CTX=5FTIMES?=
 =?utf-8?q?TAMP_TOCTOU-safe_and_handle_sentinels_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gajendra Uttamchand" <gajendra.uttamchand@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 15 Jun 2026 04:47:10 -0000
Message-ID: <178149883045.77163.18016878561574139743@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260615025729.346143-3-gajendra.uttamchand@intel.com>
In-Reply-To: <20260615025729.346143-3-gajendra.uttamchand@intel.com>
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

--===============5134857590078061055==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: make CTX_TIMESTAMP TOCTOU-safe and handle sentinels (rev2)
URL   : https://patchwork.freedesktop.org/series/168394/
State : failure

== Summary ==

CI Bug Log - changes from xe-5255-8d9ce786158fecd617b66a0809f9f2e330328052_FULL -> xe-pw-168394v2_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-168394v2_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-168394v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-168394v2_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_basic@many-bindexecqueue-userptr:
    - shard-bmg:          [PASS][1] -> [FAIL][2] +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5255-8d9ce786158fecd617b66a0809f9f2e330328052/shard-bmg-10/igt@xe_exec_basic@many-bindexecqueue-userptr.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v2/shard-bmg-7/igt@xe_exec_basic@many-bindexecqueue-userptr.html

  
Known issues
------------

  Here are the changes found in xe-pw-168394v2_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [PASS][3] -> [INCOMPLETE][4] ([Intel XE#7084] / [Intel XE#8150]) +1 other test incomplete
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5255-8d9ce786158fecd617b66a0809f9f2e330328052/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v2/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010:
    - shard-bmg:          [PASS][5] -> [SKIP][6] ([Intel XE#7915]) +3 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5255-8d9ce786158fecd617b66a0809f9f2e330328052/shard-bmg-4/igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v2/shard-bmg-7/igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010.html

  * igt@kms_setmode@basic:
    - shard-bmg:          [PASS][7] -> [FAIL][8] ([Intel XE#6361]) +2 other tests fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5255-8d9ce786158fecd617b66a0809f9f2e330328052/shard-bmg-2/igt@kms_setmode@basic.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v2/shard-bmg-4/igt@kms_setmode@basic.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [PASS][9] -> [INCOMPLETE][10] ([Intel XE#6321])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5255-8d9ce786158fecd617b66a0809f9f2e330328052/shard-bmg-10/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v2/shard-bmg-7/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_exec_system_allocator@process-many-large-execqueues-new:
    - shard-lnl:          [PASS][11] -> [ABORT][12] ([Intel XE#6652] / [Intel XE#7893])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5255-8d9ce786158fecd617b66a0809f9f2e330328052/shard-lnl-4/igt@xe_exec_system_allocator@process-many-large-execqueues-new.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v2/shard-lnl-7/igt@xe_exec_system_allocator@process-many-large-execqueues-new.html

  
#### Possible fixes ####

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ab-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][13] ([Intel XE#5408] / [Intel XE#6266]) -> [PASS][14] +1 other test pass
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5255-8d9ce786158fecd617b66a0809f9f2e330328052/shard-bmg-8/igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ab-dp2-hdmi-a3.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v2/shard-bmg-3/igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ab-dp2-hdmi-a3.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][15] ([Intel XE#1503]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5255-8d9ce786158fecd617b66a0809f9f2e330328052/shard-bmg-4/igt@kms_hdr@invalid-hdr.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v2/shard-bmg-6/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010:
    - shard-bmg:          [SKIP][17] ([Intel XE#7922]) -> [PASS][18] +1 other test pass
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5255-8d9ce786158fecd617b66a0809f9f2e330328052/shard-bmg-4/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v2/shard-bmg-6/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010.html

  * igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f:
    - shard-bmg:          [SKIP][19] ([Intel XE#7915]) -> [PASS][20] +1 other test pass
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5255-8d9ce786158fecd617b66a0809f9f2e330328052/shard-bmg-6/igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v2/shard-bmg-9/igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f.html

  
#### Warnings ####

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-lnl:          [SKIP][21] ([Intel XE#309] / [Intel XE#7343]) -> [SKIP][22] ([Intel XE#309] / [Intel XE#7343] / [Intel XE#7935])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5255-8d9ce786158fecd617b66a0809f9f2e330328052/shard-lnl-3/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v2/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][23] ([Intel XE#2426] / [Intel XE#5848]) -> [FAIL][24] ([Intel XE#1729] / [Intel XE#7424])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5255-8d9ce786158fecd617b66a0809f9f2e330328052/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v2/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][25] ([Intel XE#2426] / [Intel XE#5848]) -> [SKIP][26] ([Intel XE#2509] / [Intel XE#7437])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5255-8d9ce786158fecd617b66a0809f9f2e330328052/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v2/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#5408]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5408
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#6266]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361
  [Intel XE#6652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7893
  [Intel XE#7915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915
  [Intel XE#7922]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7922
  [Intel XE#7935]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935
  [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150


Build changes
-------------

  * Linux: xe-5255-8d9ce786158fecd617b66a0809f9f2e330328052 -> xe-pw-168394v2

  IGT_8962: 8962
  xe-5255-8d9ce786158fecd617b66a0809f9f2e330328052: 8d9ce786158fecd617b66a0809f9f2e330328052
  xe-pw-168394v2: 168394v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v2/index.html

--===============5134857590078061055==
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
<tr><td><b>Series:</b></td><td>drm/xe: make CTX_TIMESTAMP TOCTOU-safe and handle sentinels (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/168394/">https://patchwork.freedesktop.org/series/168394/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5255-8d9ce786158fecd617b66a0809f9f2e330328052_FULL -&gt; xe-pw-168394v2_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-168394v2_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-168394v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-168394v2_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_exec_basic@many-bindexecqueue-userptr:<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5255-8d9ce786158fecd617b66a0809f9f2e330328052/shard-bmg-10/igt@xe_exec_basic@many-bindexecqueue-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v2/shard-bmg-7/igt@xe_exec_basic@many-bindexecqueue-userptr.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-168394v2_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5255-8d9ce786158fecd617b66a0809f9f2e330328052/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v2/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE#8150</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5255-8d9ce786158fecd617b66a0809f9f2e330328052/shard-bmg-4/igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v2/shard-bmg-7/igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5255-8d9ce786158fecd617b66a0809f9f2e330328052/shard-bmg-2/igt@kms_setmode@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v2/shard-bmg-4/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361">Intel XE#6361</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5255-8d9ce786158fecd617b66a0809f9f2e330328052/shard-bmg-10/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v2/shard-bmg-7/igt@xe_evict@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-new:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5255-8d9ce786158fecd617b66a0809f9f2e330328052/shard-lnl-4/igt@xe_exec_system_allocator@process-many-large-execqueues-new.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v2/shard-lnl-7/igt@xe_exec_system_allocator@process-many-large-execqueues-new.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652">Intel XE#6652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7893">Intel XE#7893</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5255-8d9ce786158fecd617b66a0809f9f2e330328052/shard-bmg-8/igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ab-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5408">Intel XE#5408</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266">Intel XE#6266</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v2/shard-bmg-3/igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ab-dp2-hdmi-a3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5255-8d9ce786158fecd617b66a0809f9f2e330328052/shard-bmg-4/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v2/shard-bmg-6/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5255-8d9ce786158fecd617b66a0809f9f2e330328052/shard-bmg-4/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7922">Intel XE#7922</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v2/shard-bmg-6/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5255-8d9ce786158fecd617b66a0809f9f2e330328052/shard-bmg-6/igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v2/shard-bmg-9/igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5255-8d9ce786158fecd617b66a0809f9f2e330328052/shard-lnl-3/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v2/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935">Intel XE#7935</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5255-8d9ce786158fecd617b66a0809f9f2e330328052/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v2/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">Intel XE#7424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5255-8d9ce786158fecd617b66a0809f9f2e330328052/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v2/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437">Intel XE#7437</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5255-8d9ce786158fecd617b66a0809f9f2e330328052 -&gt; xe-pw-168394v2</li>
</ul>
<p>IGT_8962: 8962<br />
  xe-5255-8d9ce786158fecd617b66a0809f9f2e330328052: 8d9ce786158fecd617b66a0809f9f2e330328052<br />
  xe-pw-168394v2: 168394v2</p>

</body>
</html>

--===============5134857590078061055==--
