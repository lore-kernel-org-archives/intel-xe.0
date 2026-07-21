Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CED0FC4451C
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jul 2026 05:00:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A7F010E1DF;
	Tue, 21 Jul 2026 05:00:16 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4639D10E1DF;
 Tue, 21 Jul 2026 05:00:15 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2919277004688402555=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_drm/xe/forcewake=3A_add_de?=
 =?utf-8?q?layed-release_optimization_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Zongyao Bai" <zongyao.bai@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 21 Jul 2026 05:00:15 -0000
Message-ID: <178461001528.209754.10670444499959531853@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260601213804.707256-1-zongyao.bai@intel.com>
In-Reply-To: <20260601213804.707256-1-zongyao.bai@intel.com>
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

--===============2919277004688402555==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/forcewake: add delayed-release optimization (rev4)
URL   : https://patchwork.freedesktop.org/series/167697/
State : success

== Summary ==

CI Bug Log - changes from xe-5443-b521b0cb70bcb6e524b6c2ee6f86f5c6f0803405_FULL -> xe-pw-167697v4_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-167697v4_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@addfb25-bad-modifier:
    - shard-bmg:          [PASS][1] -> [INCOMPLETE][2] ([Intel XE#2594])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5443-b521b0cb70bcb6e524b6c2ee6f86f5c6f0803405/shard-bmg-4/igt@kms_addfb_basic@addfb25-bad-modifier.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v4/shard-bmg-6/igt@kms_addfb_basic@addfb25-bad-modifier.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-bmg:          [PASS][3] -> [FAIL][4] ([Intel XE#3718] / [Intel XE#6078])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5443-b521b0cb70bcb6e524b6c2ee6f86f5c6f0803405/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v4/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-c-dp-2:
    - shard-bmg:          [PASS][5] -> [FAIL][6] ([Intel XE#6078])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5443-b521b0cb70bcb6e524b6c2ee6f86f5c6f0803405/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-dp-2.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v4/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-dp-2.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:
    - shard-lnl:          [PASS][7] -> [FAIL][8] ([Intel XE#301])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5443-b521b0cb70bcb6e524b6c2ee6f86f5c6f0803405/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v4/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
    - shard-lnl:          [PASS][9] -> [FAIL][10] ([Intel XE#301] / [Intel XE#3149]) +1 other test fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5443-b521b0cb70bcb6e524b6c2ee6f86f5c6f0803405/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v4/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [PASS][11] -> [INCOMPLETE][12] ([Intel XE#6321] / [Intel XE#8355])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5443-b521b0cb70bcb6e524b6c2ee6f86f5c6f0803405/shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-small.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v4/shard-bmg-4/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_pcode_probe_early:
    - shard-bmg:          [PASS][13] -> [ABORT][14] ([Intel XE#8007])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5443-b521b0cb70bcb6e524b6c2ee6f86f5c6f0803405/shard-bmg-10/igt@xe_fault_injection@inject-fault-probe-function-xe_pcode_probe_early.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v4/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_pcode_probe_early.html

  
#### Possible fixes ####

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-bmg:          [FAIL][15] ([Intel XE#3718] / [Intel XE#6078]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5443-b521b0cb70bcb6e524b6c2ee6f86f5c6f0803405/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v4/shard-bmg-10/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2:
    - shard-bmg:          [FAIL][17] ([Intel XE#6078]) -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5443-b521b0cb70bcb6e524b6c2ee6f86f5c6f0803405/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v4/shard-bmg-10/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ad-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][19] ([Intel XE#5408] / [Intel XE#6266]) -> [PASS][20] +1 other test pass
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5443-b521b0cb70bcb6e524b6c2ee6f86f5c6f0803405/shard-bmg-1/igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ad-dp2-hdmi-a3.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v4/shard-bmg-4/igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ad-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [FAIL][21] ([Intel XE#301]) -> [PASS][22] +1 other test pass
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5443-b521b0cb70bcb6e524b6c2ee6f86f5c6f0803405/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v4/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@plain-flip-ts-check@c-edp1:
    - shard-lnl:          [FAIL][23] ([Intel XE#3149] / [Intel XE#6266]) -> [PASS][24] +1 other test pass
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5443-b521b0cb70bcb6e524b6c2ee6f86f5c6f0803405/shard-lnl-7/igt@kms_flip@plain-flip-ts-check@c-edp1.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v4/shard-lnl-6/igt@kms_flip@plain-flip-ts-check@c-edp1.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][25] ([Intel XE#1503]) -> [PASS][26]
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5443-b521b0cb70bcb6e524b6c2ee6f86f5c6f0803405/shard-bmg-5/igt@kms_hdr@invalid-hdr.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v4/shard-bmg-8/igt@kms_hdr@invalid-hdr.html

  
#### Warnings ####

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-lnl:          [SKIP][27] ([Intel XE#309] / [Intel XE#7343]) -> [SKIP][28] ([Intel XE#309] / [Intel XE#7343] / [Intel XE#7935])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5443-b521b0cb70bcb6e524b6c2ee6f86f5c6f0803405/shard-lnl-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v4/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][29] ([Intel XE#2509] / [Intel XE#7437]) -> [SKIP][30] ([Intel XE#2426] / [Intel XE#5848])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5443-b521b0cb70bcb6e524b6c2ee6f86f5c6f0803405/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v4/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#5408]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5408
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#6266]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7935]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355


Build changes
-------------

  * Linux: xe-5443-b521b0cb70bcb6e524b6c2ee6f86f5c6f0803405 -> xe-pw-167697v4

  IGT_9014: 6d3784ab505ea6a7917b191c0e060d5b4b0c2be7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5443-b521b0cb70bcb6e524b6c2ee6f86f5c6f0803405: b521b0cb70bcb6e524b6c2ee6f86f5c6f0803405
  xe-pw-167697v4: 167697v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v4/index.html

--===============2919277004688402555==
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
<tr><td><b>Series:</b></td><td>drm/xe/forcewake: add delayed-release optimization (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/167697/">https://patchwork.freedesktop.org/series/167697/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5443-b521b0cb70bcb6e524b6c2ee6f86f5c6f0803405_FULL -&gt; xe-pw-167697v4_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-167697v4_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-bad-modifier:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5443-b521b0cb70bcb6e524b6c2ee6f86f5c6f0803405/shard-bmg-4/igt@kms_addfb_basic@addfb25-bad-modifier.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v4/shard-bmg-6/igt@kms_addfb_basic@addfb25-bad-modifier.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594">Intel XE#2594</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5443-b521b0cb70bcb6e524b6c2ee6f86f5c6f0803405/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v4/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5443-b521b0cb70bcb6e524b6c2ee6f86f5c6f0803405/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v4/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5443-b521b0cb70bcb6e524b6c2ee6f86f5c6f0803405/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v4/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5443-b521b0cb70bcb6e524b6c2ee6f86f5c6f0803405/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v4/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5443-b521b0cb70bcb6e524b6c2ee6f86f5c6f0803405/shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v4/shard-bmg-4/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355">Intel XE#8355</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_pcode_probe_early:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5443-b521b0cb70bcb6e524b6c2ee6f86f5c6f0803405/shard-bmg-10/igt@xe_fault_injection@inject-fault-probe-function-xe_pcode_probe_early.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v4/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_pcode_probe_early.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5443-b521b0cb70bcb6e524b6c2ee6f86f5c6f0803405/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v4/shard-bmg-10/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5443-b521b0cb70bcb6e524b6c2ee6f86f5c6f0803405/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v4/shard-bmg-10/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ad-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5443-b521b0cb70bcb6e524b6c2ee6f86f5c6f0803405/shard-bmg-1/igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ad-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5408">Intel XE#5408</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266">Intel XE#6266</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v4/shard-bmg-4/igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ad-dp2-hdmi-a3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5443-b521b0cb70bcb6e524b6c2ee6f86f5c6f0803405/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v4/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5443-b521b0cb70bcb6e524b6c2ee6f86f5c6f0803405/shard-lnl-7/igt@kms_flip@plain-flip-ts-check@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266">Intel XE#6266</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v4/shard-lnl-6/igt@kms_flip@plain-flip-ts-check@c-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5443-b521b0cb70bcb6e524b6c2ee6f86f5c6f0803405/shard-bmg-5/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v4/shard-bmg-8/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5443-b521b0cb70bcb6e524b6c2ee6f86f5c6f0803405/shard-lnl-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v4/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935">Intel XE#7935</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5443-b521b0cb70bcb6e524b6c2ee6f86f5c6f0803405/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437">Intel XE#7437</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167697v4/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5443-b521b0cb70bcb6e524b6c2ee6f86f5c6f0803405 -&gt; xe-pw-167697v4</li>
</ul>
<p>IGT_9014: 6d3784ab505ea6a7917b191c0e060d5b4b0c2be7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5443-b521b0cb70bcb6e524b6c2ee6f86f5c6f0803405: b521b0cb70bcb6e524b6c2ee6f86f5c6f0803405<br />
  xe-pw-167697v4: 167697v4</p>

</body>
</html>

--===============2919277004688402555==--
