Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17371C52D7C
	for <intel-xe@archiver.kernel.org>; Tue, 13 Aug 2024 17:27:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA1D610E3B1;
	Tue, 13 Aug 2024 17:27:27 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7715410E3B1;
 Tue, 13 Aug 2024 17:27:26 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8229745465480636948=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_series_starting_with_=5B1/7=5D_d?=
 =?utf-8?q?rm/i915/display=3A_support_struct_intel=5Fatomic=5Fstate_in_to=5F?=
 =?utf-8?q?intel=5Fdisplay=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 13 Aug 2024 17:27:26 -0000
Message-ID: <172357004648.614286.36002372429679570@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240813164123.2674462-1-jani.nikula@intel.com>
In-Reply-To: <20240813164123.2674462-1-jani.nikula@intel.com>
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

--===============8229745465480636948==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/7] drm/i915/display: support struct intel_atomic_state in to_intel_display()
URL   : https://patchwork.freedesktop.org/series/137250/
State : success

== Summary ==

CI Bug Log - changes from xe-1760-4d1d605f5ff966b0df757c683e396a9f3e77171b_BAT -> xe-pw-137250v1_BAT
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

  Here are the changes found in xe-pw-137250v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-lnl-1:          [PASS][1] -> [SKIP][2] ([Intel XE#1885])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1760-4d1d605f5ff966b0df757c683e396a9f3e77171b/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137250v1/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-lnl-1:          [PASS][3] -> [FAIL][4] ([Intel XE#886]) +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1760-4d1d605f5ff966b0df757c683e396a9f3e77171b/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137250v1/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1:
    - bat-lnl-1:          [PASS][5] -> [DMESG-FAIL][6] ([Intel XE#1620] / [Intel XE#1760]) +1 other test dmesg-fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1760-4d1d605f5ff966b0df757c683e396a9f3e77171b/bat-lnl-1/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137250v1/bat-lnl-1/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence:
    - bat-lnl-1:          [PASS][7] -> [SKIP][8] ([Intel XE#2423]) +4 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1760-4d1d605f5ff966b0df757c683e396a9f3e77171b/bat-lnl-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137250v1/bat-lnl-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - bat-lnl-1:          [PASS][9] -> [SKIP][10] ([Intel XE#2351]) +2 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1760-4d1d605f5ff966b0df757c683e396a9f3e77171b/bat-lnl-1/igt@kms_psr@psr-sprite-plane-onoff.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137250v1/bat-lnl-1/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@xe_live_ktest@xe_migrate:
    - bat-lnl-1:          [PASS][11] -> [SKIP][12] ([Intel XE#1192]) +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1760-4d1d605f5ff966b0df757c683e396a9f3e77171b/bat-lnl-1/igt@xe_live_ktest@xe_migrate.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137250v1/bat-lnl-1/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_mmap@cpu-caching:
    - bat-lnl-1:          [PASS][13] -> [SKIP][14] ([Intel XE#1130]) +170 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1760-4d1d605f5ff966b0df757c683e396a9f3e77171b/bat-lnl-1/igt@xe_mmap@cpu-caching.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137250v1/bat-lnl-1/igt@xe_mmap@cpu-caching.html

  
#### Possible fixes ####

  * igt@xe_exec_balancer@twice-parallel-userptr-invalidate:
    - bat-bmg-1:          [DMESG-WARN][15] ([Intel XE#877]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1760-4d1d605f5ff966b0df757c683e396a9f3e77171b/bat-bmg-1/igt@xe_exec_balancer@twice-parallel-userptr-invalidate.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137250v1/bat-bmg-1/igt@xe_exec_balancer@twice-parallel-userptr-invalidate.html

  
#### Warnings ####

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - bat-lnl-1:          [SKIP][17] ([Intel XE#1091]) -> [SKIP][18] ([Intel XE#2423]) +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1760-4d1d605f5ff966b0df757c683e396a9f3e77171b/bat-lnl-1/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137250v1/bat-lnl-1/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:
    - bat-lnl-1:          [SKIP][19] ([Intel XE#688]) -> [SKIP][20] ([Intel XE#1130]) +17 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1760-4d1d605f5ff966b0df757c683e396a9f3e77171b/bat-lnl-1/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137250v1/bat-lnl-1/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html

  * igt@xe_live_ktest@xe_bo:
    - bat-lnl-1:          [SKIP][21] -> [SKIP][22] ([Intel XE#1192])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1760-4d1d605f5ff966b0df757c683e396a9f3e77171b/bat-lnl-1/igt@xe_live_ktest@xe_bo.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137250v1/bat-lnl-1/igt@xe_live_ktest@xe_bo.html

  * igt@xe_mmap@vram:
    - bat-lnl-1:          [SKIP][23] ([Intel XE#1416]) -> [SKIP][24] ([Intel XE#1130])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1760-4d1d605f5ff966b0df757c683e396a9f3e77171b/bat-lnl-1/igt@xe_mmap@vram.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137250v1/bat-lnl-1/igt@xe_mmap@vram.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-lnl-1:          [SKIP][25] ([Intel XE#1420]) -> [SKIP][26] ([Intel XE#1130])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1760-4d1d605f5ff966b0df757c683e396a9f3e77171b/bat-lnl-1/igt@xe_pat@pat-index-xehpc.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137250v1/bat-lnl-1/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelp:
    - bat-lnl-1:          [SKIP][27] ([Intel XE#977]) -> [SKIP][28] ([Intel XE#1130])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1760-4d1d605f5ff966b0df757c683e396a9f3e77171b/bat-lnl-1/igt@xe_pat@pat-index-xelp.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137250v1/bat-lnl-1/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@pat-index-xelpg:
    - bat-lnl-1:          [SKIP][29] ([Intel XE#979]) -> [SKIP][30] ([Intel XE#1130])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1760-4d1d605f5ff966b0df757c683e396a9f3e77171b/bat-lnl-1/igt@xe_pat@pat-index-xelpg.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137250v1/bat-lnl-1/igt@xe_pat@pat-index-xelpg.html

  
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1620]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
  [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
  [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * Linux: xe-1760-4d1d605f5ff966b0df757c683e396a9f3e77171b -> xe-pw-137250v1

  IGT_7967: 290bdef9033c8b185922f02cd05d62fcc0091c15 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1760-4d1d605f5ff966b0df757c683e396a9f3e77171b: 4d1d605f5ff966b0df757c683e396a9f3e77171b
  xe-pw-137250v1: 137250v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137250v1/index.html

--===============8229745465480636948==
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
<tr><td><b>Series:</b></td><td>series starting with [1/7] drm/i915/display: support struct intel_atomic_state in to_intel_display()</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137250/">https://patchwork.freedesktop.org/series/137250/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137250v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137250v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1760-4d1d605f5ff966b0df757c683e396a9f3e77171b_BAT -&gt; xe-pw-137250v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-137250v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1760-4d1d605f5ff966b0df757c683e396a9f3e77171b/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137250v1/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1760-4d1d605f5ff966b0df757c683e396a9f3e77171b/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137250v1/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1760-4d1d605f5ff966b0df757c683e396a9f3e77171b/bat-lnl-1/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137250v1/bat-lnl-1/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1760-4d1d605f5ff966b0df757c683e396a9f3e77171b/bat-lnl-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137250v1/bat-lnl-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1760-4d1d605f5ff966b0df757c683e396a9f3e77171b/bat-lnl-1/igt@kms_psr@psr-sprite-plane-onoff.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137250v1/bat-lnl-1/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1760-4d1d605f5ff966b0df757c683e396a9f3e77171b/bat-lnl-1/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137250v1/bat-lnl-1/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@cpu-caching:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1760-4d1d605f5ff966b0df757c683e396a9f3e77171b/bat-lnl-1/igt@xe_mmap@cpu-caching.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137250v1/bat-lnl-1/igt@xe_mmap@cpu-caching.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +170 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_exec_balancer@twice-parallel-userptr-invalidate:<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1760-4d1d605f5ff966b0df757c683e396a9f3e77171b/bat-bmg-1/igt@xe_exec_balancer@twice-parallel-userptr-invalidate.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137250v1/bat-bmg-1/igt@xe_exec_balancer@twice-parallel-userptr-invalidate.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1760-4d1d605f5ff966b0df757c683e396a9f3e77171b/bat-lnl-1/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137250v1/bat-lnl-1/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1760-4d1d605f5ff966b0df757c683e396a9f3e77171b/bat-lnl-1/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137250v1/bat-lnl-1/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1760-4d1d605f5ff966b0df757c683e396a9f3e77171b/bat-lnl-1/igt@xe_live_ktest@xe_bo.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137250v1/bat-lnl-1/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1760-4d1d605f5ff966b0df757c683e396a9f3e77171b/bat-lnl-1/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416">Intel XE#1416</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137250v1/bat-lnl-1/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1760-4d1d605f5ff966b0df757c683e396a9f3e77171b/bat-lnl-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137250v1/bat-lnl-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1760-4d1d605f5ff966b0df757c683e396a9f3e77171b/bat-lnl-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137250v1/bat-lnl-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1760-4d1d605f5ff966b0df757c683e396a9f3e77171b/bat-lnl-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137250v1/bat-lnl-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1760-4d1d605f5ff966b0df757c683e396a9f3e77171b -&gt; xe-pw-137250v1</li>
</ul>
<p>IGT_7967: 290bdef9033c8b185922f02cd05d62fcc0091c15 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1760-4d1d605f5ff966b0df757c683e396a9f3e77171b: 4d1d605f5ff966b0df757c683e396a9f3e77171b<br />
  xe-pw-137250v1: 137250v1</p>

</body>
</html>

--===============8229745465480636948==--
