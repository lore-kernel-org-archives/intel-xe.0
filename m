Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCBA6CF6D39
	for <intel-xe@archiver.kernel.org>; Wed,  2 Oct 2024 15:29:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CC0310E174;
	Wed,  2 Oct 2024 15:29:44 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DC1E10E174;
 Wed,  2 Oct 2024 15:29:43 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7268965887523781109=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_Use_user-defined_workqueue_lockd?=
 =?utf-8?q?ep_map_for_drm_sched?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 02 Oct 2024 15:29:43 -0000
Message-ID: <172788298304.1164007.9588523760843761964@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241002131639.3425022-1-matthew.brost@intel.com>
In-Reply-To: <20241002131639.3425022-1-matthew.brost@intel.com>
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

--===============7268965887523781109==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Use user-defined workqueue lockdep map for drm sched
URL   : https://patchwork.freedesktop.org/series/139429/
State : success

== Summary ==

CI Bug Log - changes from xe-2004-d91e474f9dd2c29e4927c2b2ddbe28a313bf593f_BAT -> xe-pw-139429v1_BAT
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

  Here are the changes found in xe-pw-139429v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-hdmi-a-3:
    - bat-bmg-1:          [PASS][1] -> [DMESG-WARN][2] ([Intel XE#877]) +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2004-d91e474f9dd2c29e4927c2b2ddbe28a313bf593f/bat-bmg-1/igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-hdmi-a-3.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139429v1/bat-bmg-1/igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-hdmi-a-3.html

  
#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-lnl-1:          [SKIP][3] ([Intel XE#1885]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2004-d91e474f9dd2c29e4927c2b2ddbe28a313bf593f/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139429v1/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [FAIL][5] ([Intel XE#1861]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2004-d91e474f9dd2c29e4927c2b2ddbe28a313bf593f/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139429v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-edp-1:
    - bat-lnl-1:          [INCOMPLETE][7] ([Intel XE#1620] / [Intel XE#1760]) -> [PASS][8] +1 other test pass
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2004-d91e474f9dd2c29e4927c2b2ddbe28a313bf593f/bat-lnl-1/igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-edp-1.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139429v1/bat-lnl-1/igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-edp-1.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence:
    - bat-lnl-1:          [SKIP][9] ([Intel XE#2423]) -> [PASS][10] +4 other tests pass
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2004-d91e474f9dd2c29e4927c2b2ddbe28a313bf593f/bat-lnl-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139429v1/bat-lnl-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - bat-lnl-1:          [SKIP][11] ([Intel XE#2351]) -> [PASS][12] +2 other tests pass
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2004-d91e474f9dd2c29e4927c2b2ddbe28a313bf593f/bat-lnl-1/igt@kms_psr@psr-sprite-plane-onoff.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139429v1/bat-lnl-1/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@xe_live_ktest@xe_bo:
    - bat-lnl-1:          [FAIL][13] -> [PASS][14] +6 other tests pass
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2004-d91e474f9dd2c29e4927c2b2ddbe28a313bf593f/bat-lnl-1/igt@xe_live_ktest@xe_bo.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139429v1/bat-lnl-1/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
    - {bat-bmg-2}:        [INCOMPLETE][15] ([Intel XE#2874]) -> [PASS][16] +1 other test pass
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2004-d91e474f9dd2c29e4927c2b2ddbe28a313bf593f/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139429v1/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html

  * igt@xe_mmap@cpu-caching:
    - bat-lnl-1:          [SKIP][17] ([Intel XE#1130]) -> [PASS][18] +170 other tests pass
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2004-d91e474f9dd2c29e4927c2b2ddbe28a313bf593f/bat-lnl-1/igt@xe_mmap@cpu-caching.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139429v1/bat-lnl-1/igt@xe_mmap@cpu-caching.html

  * igt@xe_pat@pat-index-all:
    - bat-bmg-1:          [DMESG-WARN][19] ([Intel XE#877]) -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2004-d91e474f9dd2c29e4927c2b2ddbe28a313bf593f/bat-bmg-1/igt@xe_pat@pat-index-all.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139429v1/bat-bmg-1/igt@xe_pat@pat-index-all.html

  
#### Warnings ####

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - bat-lnl-1:          [SKIP][21] ([Intel XE#2423]) -> [SKIP][22] ([Intel XE#1091] / [Intel XE#2849]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2004-d91e474f9dd2c29e4927c2b2ddbe28a313bf593f/bat-lnl-1/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139429v1/bat-lnl-1/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:
    - bat-lnl-1:          [SKIP][23] ([Intel XE#1130]) -> [SKIP][24] ([Intel XE#688]) +17 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2004-d91e474f9dd2c29e4927c2b2ddbe28a313bf593f/bat-lnl-1/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139429v1/bat-lnl-1/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - bat-lnl-1:          [FAIL][25] -> [SKIP][26] ([Intel XE#2229]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2004-d91e474f9dd2c29e4927c2b2ddbe28a313bf593f/bat-lnl-1/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139429v1/bat-lnl-1/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_mmap@vram:
    - bat-lnl-1:          [SKIP][27] ([Intel XE#1130]) -> [SKIP][28] ([Intel XE#1416])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2004-d91e474f9dd2c29e4927c2b2ddbe28a313bf593f/bat-lnl-1/igt@xe_mmap@vram.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139429v1/bat-lnl-1/igt@xe_mmap@vram.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-lnl-1:          [SKIP][29] ([Intel XE#1130]) -> [SKIP][30] ([Intel XE#2838])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2004-d91e474f9dd2c29e4927c2b2ddbe28a313bf593f/bat-lnl-1/igt@xe_pat@pat-index-xehpc.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139429v1/bat-lnl-1/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelp:
    - bat-lnl-1:          [SKIP][31] ([Intel XE#1130]) -> [SKIP][32] ([Intel XE#977])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2004-d91e474f9dd2c29e4927c2b2ddbe28a313bf593f/bat-lnl-1/igt@xe_pat@pat-index-xelp.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139429v1/bat-lnl-1/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@pat-index-xelpg:
    - bat-lnl-1:          [SKIP][33] ([Intel XE#1130]) -> [SKIP][34] ([Intel XE#979])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2004-d91e474f9dd2c29e4927c2b2ddbe28a313bf593f/bat-lnl-1/igt@xe_pat@pat-index-xelpg.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139429v1/bat-lnl-1/igt@xe_pat@pat-index-xelpg.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416
  [Intel XE#1620]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
  [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * IGT: IGT_8048 -> IGT_8049
  * Linux: xe-2004-d91e474f9dd2c29e4927c2b2ddbe28a313bf593f -> xe-pw-139429v1

  IGT_8048: 4ade707fbd17f6300b8c444e2d86216005f199e5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8049: 909157f3cc3c0676a4f896752276d438c3ec3959 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2004-d91e474f9dd2c29e4927c2b2ddbe28a313bf593f: d91e474f9dd2c29e4927c2b2ddbe28a313bf593f
  xe-pw-139429v1: 139429v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139429v1/index.html

--===============7268965887523781109==
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
<tr><td><b>Series:</b></td><td>Use user-defined workqueue lockdep map for drm sched</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/139429/">https://patchwork.freedesktop.org/series/139429/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139429v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139429v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2004-d91e474f9dd2c29e4927c2b2ddbe28a313bf593f_BAT -&gt; xe-pw-139429v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-139429v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-hdmi-a-3:<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2004-d91e474f9dd2c29e4927c2b2ddbe28a313bf593f/bat-bmg-1/igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-hdmi-a-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139429v1/bat-bmg-1/igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-hdmi-a-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2004-d91e474f9dd2c29e4927c2b2ddbe28a313bf593f/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139429v1/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2004-d91e474f9dd2c29e4927c2b2ddbe28a313bf593f/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139429v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-edp-1:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2004-d91e474f9dd2c29e4927c2b2ddbe28a313bf593f/bat-lnl-1/igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-edp-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139429v1/bat-lnl-1/igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2004-d91e474f9dd2c29e4927c2b2ddbe28a313bf593f/bat-lnl-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139429v1/bat-lnl-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2004-d91e474f9dd2c29e4927c2b2ddbe28a313bf593f/bat-lnl-1/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139429v1/bat-lnl-1/igt@kms_psr@psr-sprite-plane-onoff.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2004-d91e474f9dd2c29e4927c2b2ddbe28a313bf593f/bat-lnl-1/igt@xe_live_ktest@xe_bo.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139429v1/bat-lnl-1/igt@xe_live_ktest@xe_bo.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:</p>
<ul>
<li>{bat-bmg-2}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2004-d91e474f9dd2c29e4927c2b2ddbe28a313bf593f/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874">Intel XE#2874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139429v1/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@cpu-caching:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2004-d91e474f9dd2c29e4927c2b2ddbe28a313bf593f/bat-lnl-1/igt@xe_mmap@cpu-caching.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139429v1/bat-lnl-1/igt@xe_mmap@cpu-caching.html">PASS</a> +170 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-all:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2004-d91e474f9dd2c29e4927c2b2ddbe28a313bf593f/bat-bmg-1/igt@xe_pat@pat-index-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139429v1/bat-bmg-1/igt@xe_pat@pat-index-all.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2004-d91e474f9dd2c29e4927c2b2ddbe28a313bf593f/bat-lnl-1/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139429v1/bat-lnl-1/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2004-d91e474f9dd2c29e4927c2b2ddbe28a313bf593f/bat-lnl-1/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139429v1/bat-lnl-1/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2004-d91e474f9dd2c29e4927c2b2ddbe28a313bf593f/bat-lnl-1/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139429v1/bat-lnl-1/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2004-d91e474f9dd2c29e4927c2b2ddbe28a313bf593f/bat-lnl-1/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139429v1/bat-lnl-1/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416">Intel XE#1416</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2004-d91e474f9dd2c29e4927c2b2ddbe28a313bf593f/bat-lnl-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139429v1/bat-lnl-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2004-d91e474f9dd2c29e4927c2b2ddbe28a313bf593f/bat-lnl-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139429v1/bat-lnl-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2004-d91e474f9dd2c29e4927c2b2ddbe28a313bf593f/bat-lnl-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139429v1/bat-lnl-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8048 -&gt; IGT_8049</li>
<li>Linux: xe-2004-d91e474f9dd2c29e4927c2b2ddbe28a313bf593f -&gt; xe-pw-139429v1</li>
</ul>
<p>IGT_8048: 4ade707fbd17f6300b8c444e2d86216005f199e5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8049: 909157f3cc3c0676a4f896752276d438c3ec3959 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2004-d91e474f9dd2c29e4927c2b2ddbe28a313bf593f: d91e474f9dd2c29e4927c2b2ddbe28a313bf593f<br />
  xe-pw-139429v1: 139429v1</p>

</body>
</html>

--===============7268965887523781109==--
