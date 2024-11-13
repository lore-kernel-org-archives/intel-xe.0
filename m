Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D67ADD637CD
	for <intel-xe@archiver.kernel.org>; Wed, 13 Nov 2024 21:59:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5E7010E05E;
	Wed, 13 Nov 2024 21:59:48 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5786F10E05E;
 Wed, 13 Nov 2024 21:59:47 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4949088399803142422=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_TTM_shrinker_helpers_and_xe_buff?=
 =?utf-8?q?er_object_shrinker_=28rev12=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 13 Nov 2024 21:59:47 -0000
Message-ID: <173153518735.3708786.9413737515515229595@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241113183550.6228-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20241113183550.6228-1-thomas.hellstrom@linux.intel.com>
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

--===============4949088399803142422==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: TTM shrinker helpers and xe buffer object shrinker (rev12)
URL   : https://patchwork.freedesktop.org/series/131815/
State : failure

== Summary ==

CI Bug Log - changes from xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70_BAT -> xe-pw-131815v12_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-131815v12_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-131815v12_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-131815v12_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_pat@prime-external-import-coh:
    - bat-bmg-2:          [PASS][1] -> [DMESG-FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/bat-bmg-2/igt@xe_pat@prime-external-import-coh.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/bat-bmg-2/igt@xe_pat@prime-external-import-coh.html
    - bat-bmg-1:          [PASS][3] -> [DMESG-FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/bat-bmg-1/igt@xe_pat@prime-external-import-coh.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/bat-bmg-1/igt@xe_pat@prime-external-import-coh.html
    - bat-adlp-7:         [PASS][5] -> [DMESG-FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/bat-adlp-7/igt@xe_pat@prime-external-import-coh.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/bat-adlp-7/igt@xe_pat@prime-external-import-coh.html
    - bat-lnl-2:          [PASS][7] -> [DMESG-FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/bat-lnl-2/igt@xe_pat@prime-external-import-coh.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/bat-lnl-2/igt@xe_pat@prime-external-import-coh.html
    - bat-dg2-oem2:       [PASS][9] -> [DMESG-FAIL][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/bat-dg2-oem2/igt@xe_pat@prime-external-import-coh.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/bat-dg2-oem2/igt@xe_pat@prime-external-import-coh.html
    - bat-atsm-2:         [PASS][11] -> [DMESG-FAIL][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/bat-atsm-2/igt@xe_pat@prime-external-import-coh.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/bat-atsm-2/igt@xe_pat@prime-external-import-coh.html
    - bat-adlp-vf:        [PASS][13] -> [DMESG-FAIL][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/bat-adlp-vf/igt@xe_pat@prime-external-import-coh.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/bat-adlp-vf/igt@xe_pat@prime-external-import-coh.html
    - bat-lnl-1:          [PASS][15] -> [DMESG-FAIL][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/bat-lnl-1/igt@xe_pat@prime-external-import-coh.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/bat-lnl-1/igt@xe_pat@prime-external-import-coh.html
    - bat-pvc-2:          [PASS][17] -> [DMESG-FAIL][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/bat-pvc-2/igt@xe_pat@prime-external-import-coh.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/bat-pvc-2/igt@xe_pat@prime-external-import-coh.html

  
Known issues
------------

  Here are the changes found in xe-pw-131815v12_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-adlp-7:         [PASS][19] -> [DMESG-WARN][20] ([Intel XE#2871])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - bat-adlp-7:         [PASS][21] -> [SKIP][22] ([Intel XE#455]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/bat-adlp-7/igt@kms_psr@psr-sprite-plane-onoff.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/bat-adlp-7/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@xe_evict@evict-beng-small:
    - bat-adlp-7:         NOTRUN -> [SKIP][23] ([Intel XE#261] / [Intel XE#688]) +15 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/bat-adlp-7/igt@xe_evict@evict-beng-small.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:
    - bat-adlp-7:         NOTRUN -> [SKIP][24] ([Intel XE#288]) +32 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html

  * igt@xe_live_ktest@xe_bo:
    - bat-adlp-vf:        [PASS][25] -> [SKIP][26] ([Intel XE#1192]) +2 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html
    - bat-lnl-1:          [PASS][27] -> [SKIP][28] ([Intel XE#1192]) +2 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/bat-lnl-1/igt@xe_live_ktest@xe_bo.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/bat-lnl-1/igt@xe_live_ktest@xe_bo.html
    - bat-pvc-2:          [PASS][29] -> [SKIP][30] ([Intel XE#1192]) +2 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/bat-pvc-2/igt@xe_live_ktest@xe_bo.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/bat-pvc-2/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_dma_buf:
    - bat-bmg-2:          [PASS][31] -> [SKIP][32] ([Intel XE#1192]) +2 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html

  * igt@xe_live_ktest@xe_migrate:
    - bat-bmg-1:          [PASS][33] -> [SKIP][34] ([Intel XE#1192]) +2 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html
    - bat-adlp-7:         NOTRUN -> [SKIP][35] ([Intel XE#1192]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/bat-adlp-7/igt@xe_live_ktest@xe_migrate.html
    - bat-lnl-2:          [PASS][36] -> [SKIP][37] ([Intel XE#1192]) +2 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/bat-lnl-2/igt@xe_live_ktest@xe_migrate.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/bat-lnl-2/igt@xe_live_ktest@xe_migrate.html
    - bat-dg2-oem2:       [PASS][38] -> [SKIP][39] ([Intel XE#1192]) +2 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html
    - bat-atsm-2:         [PASS][40] -> [SKIP][41] ([Intel XE#1192]) +2 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html

  
#### Possible fixes ####

  * igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race:
    - bat-bmg-1:          [DMESG-WARN][42] ([Intel XE#2687]) -> [PASS][43]
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/bat-bmg-1/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/bat-bmg-1/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html

  
#### Warnings ####

  * igt@xe_live_ktest@xe_bo:
    - bat-adlp-7:         [INCOMPLETE][44] ([Intel XE#2874]) -> [SKIP][45] ([Intel XE#1192])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/bat-adlp-7/igt@xe_live_ktest@xe_bo.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/bat-adlp-7/igt@xe_live_ktest@xe_bo.html

  
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2687]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2687
  [Intel XE#2871]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2871
  [Intel XE#2874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688


Build changes
-------------

  * Linux: xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70 -> xe-pw-131815v12

  IGT_8107: 0362b0deec80daaecdfa3dd0676dcabb6f14bd9c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70: d8d960b20b0dc59b06c24fc210387b9c158edf70
  xe-pw-131815v12: 131815v12

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/index.html

--===============4949088399803142422==
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
<tr><td><b>Series:</b></td><td>TTM shrinker helpers and xe buffer object shrinker (rev12)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131815/">https://patchwork.freedesktop.org/series/131815/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70_BAT -&gt; xe-pw-131815v12_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-131815v12_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-131815v12_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-131815v12_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_pat@prime-external-import-coh:<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/bat-bmg-2/igt@xe_pat@prime-external-import-coh.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/bat-bmg-2/igt@xe_pat@prime-external-import-coh.html">DMESG-FAIL</a></li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/bat-bmg-1/igt@xe_pat@prime-external-import-coh.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/bat-bmg-1/igt@xe_pat@prime-external-import-coh.html">DMESG-FAIL</a></li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/bat-adlp-7/igt@xe_pat@prime-external-import-coh.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/bat-adlp-7/igt@xe_pat@prime-external-import-coh.html">DMESG-FAIL</a></li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/bat-lnl-2/igt@xe_pat@prime-external-import-coh.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/bat-lnl-2/igt@xe_pat@prime-external-import-coh.html">DMESG-FAIL</a></li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/bat-dg2-oem2/igt@xe_pat@prime-external-import-coh.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/bat-dg2-oem2/igt@xe_pat@prime-external-import-coh.html">DMESG-FAIL</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/bat-atsm-2/igt@xe_pat@prime-external-import-coh.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/bat-atsm-2/igt@xe_pat@prime-external-import-coh.html">DMESG-FAIL</a></li>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/bat-adlp-vf/igt@xe_pat@prime-external-import-coh.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/bat-adlp-vf/igt@xe_pat@prime-external-import-coh.html">DMESG-FAIL</a></li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/bat-lnl-1/igt@xe_pat@prime-external-import-coh.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/bat-lnl-1/igt@xe_pat@prime-external-import-coh.html">DMESG-FAIL</a></li>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/bat-pvc-2/igt@xe_pat@prime-external-import-coh.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/bat-pvc-2/igt@xe_pat@prime-external-import-coh.html">DMESG-FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-131815v12_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2871">Intel XE#2871</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/bat-adlp-7/igt@kms_psr@psr-sprite-plane-onoff.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/bat-adlp-7/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/bat-adlp-7/igt@xe_evict@evict-beng-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +2 other tests skip</li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/bat-lnl-1/igt@xe_live_ktest@xe_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/bat-lnl-1/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +2 other tests skip</li>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/bat-pvc-2/igt@xe_live_ktest@xe_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/bat-pvc-2/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +2 other tests skip</li>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/bat-adlp-7/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +1 other test skip</li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/bat-lnl-2/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/bat-lnl-2/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +2 other tests skip</li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +2 other tests skip</li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race:<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/bat-bmg-1/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2687">Intel XE#2687</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/bat-bmg-1/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_live_ktest@xe_bo:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70/bat-adlp-7/igt@xe_live_ktest@xe_bo.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874">Intel XE#2874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131815v12/bat-adlp-7/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70 -&gt; xe-pw-131815v12</li>
</ul>
<p>IGT_8107: 0362b0deec80daaecdfa3dd0676dcabb6f14bd9c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2223-d8d960b20b0dc59b06c24fc210387b9c158edf70: d8d960b20b0dc59b06c24fc210387b9c158edf70<br />
  xe-pw-131815v12: 131815v12</p>

</body>
</html>

--===============4949088399803142422==--
