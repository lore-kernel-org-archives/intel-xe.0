Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9850CDD1BE
	for <intel-xe@archiver.kernel.org>; Fri, 27 Sep 2024 15:41:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81CBB10ECE3;
	Fri, 27 Sep 2024 15:41:40 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE4D810ECE3;
 Fri, 27 Sep 2024 15:41:38 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5716968628556726534=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_drm/xe=3A_Fix_flickering_when_in?=
 =?utf-8?q?heriting_BIOS_fb=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 27 Sep 2024 15:41:38 -0000
Message-ID: <172745169896.1112058.4837568190499355410@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240927141404.163317-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20240927141404.163317-1-maarten.lankhorst@linux.intel.com>
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

--===============5716968628556726534==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Fix flickering when inheriting BIOS fb.
URL   : https://patchwork.freedesktop.org/series/139215/
State : failure

== Summary ==

CI Bug Log - changes from xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b_BAT -> xe-pw-139215v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-139215v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-139215v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-139215v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-bmg-1:          [PASS][1] -> [DMESG-WARN][2] +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139215v1/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html
    - bat-adlp-vf:        [PASS][3] -> [DMESG-WARN][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/bat-adlp-vf/igt@core_hotunplug@unbind-rebind.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139215v1/bat-adlp-vf/igt@core_hotunplug@unbind-rebind.html

  * igt@sriov_basic@enable-vfs-autoprobe-on:
    - bat-adlp-7:         [PASS][5] -> [DMESG-WARN][6] +1 other test dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/bat-adlp-7/igt@sriov_basic@enable-vfs-autoprobe-on.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139215v1/bat-adlp-7/igt@sriov_basic@enable-vfs-autoprobe-on.html

  * igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1:
    - bat-atsm-2:         [PASS][7] -> [DMESG-WARN][8] +1 other test dmesg-warn
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139215v1/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html

  * igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_video_enhance-instance-1-tile-0-system-memory:
    - bat-adlp-vf:        NOTRUN -> [DMESG-FAIL][9] +17 other tests dmesg-fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139215v1/bat-adlp-vf/igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_video_enhance-instance-1-tile-0-system-memory.html

  * igt@xe_exec_basic@twice-basic:
    - bat-adlp-vf:        [PASS][10] -> [DMESG-FAIL][11] +49 other tests dmesg-fail
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/bat-adlp-vf/igt@xe_exec_basic@twice-basic.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139215v1/bat-adlp-vf/igt@xe_exec_basic@twice-basic.html

  * igt@xe_live_ktest@xe_migrate:
    - bat-bmg-1:          [PASS][12] -> [SKIP][13] +2 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139215v1/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_module_load@load:
    - bat-lnl-1:          [PASS][14] -> [ABORT][15]
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/bat-lnl-1/igt@xe_module_load@load.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139215v1/bat-lnl-1/igt@xe_module_load@load.html
    - bat-lnl-2:          [PASS][16] -> [ABORT][17]
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/bat-lnl-2/igt@xe_module_load@load.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139215v1/bat-lnl-2/igt@xe_module_load@load.html

  * igt@xe_vm@bind-execqueues-independent:
    - bat-adlp-vf:        [PASS][18] -> [INCOMPLETE][19] +1 other test incomplete
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/bat-adlp-vf/igt@xe_vm@bind-execqueues-independent.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139215v1/bat-adlp-vf/igt@xe_vm@bind-execqueues-independent.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@xe_live_ktest@xe_dma_buf:
    - {bat-bmg-2}:        [PASS][20] -> [SKIP][21] +2 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139215v1/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html

  * igt@xe_module_load@load:
    - {bat-bmg-2}:        [PASS][22] -> [DMESG-WARN][23] +1 other test dmesg-warn
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/bat-bmg-2/igt@xe_module_load@load.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139215v1/bat-bmg-2/igt@xe_module_load@load.html

  
New tests
---------

  New tests have been introduced between xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b_BAT and xe-pw-139215v1_BAT:

### New IGT tests (16) ###

  * igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_video_decode-instance-2-tile-0-system-memory:
    - Statuses : 1 dmesg-fail(s)
    - Exec time: [0.03] s

  * igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_video_decode-instance-3-tile-0-system-memory:
    - Statuses : 1 dmesg-fail(s)
    - Exec time: [0.01] s

  * igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_video_decode-instance-4-tile-0-system-memory:
    - Statuses : 1 dmesg-fail(s)
    - Exec time: [0.01] s

  * igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_video_decode-instance-5-tile-0-system-memory:
    - Statuses : 1 dmesg-fail(s)
    - Exec time: [0.01] s

  * igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_video_decode-instance-6-tile-0-system-memory:
    - Statuses : 1 dmesg-fail(s)
    - Exec time: [0.01] s

  * igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_video_decode-instance-7-tile-0-system-memory:
    - Statuses : 1 dmesg-fail(s)
    - Exec time: [0.01] s

  * igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_video_enhance-instance-2-tile-0-system-memory:
    - Statuses : 1 dmesg-fail(s)
    - Exec time: [0.02] s

  * igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_video_enhance-instance-3-tile-0-system-memory:
    - Statuses : 1 dmesg-fail(s)
    - Exec time: [0.02] s

  * igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_video_decode-instance-2-tile-0-system-memory:
    - Statuses : 1 dmesg-fail(s)
    - Exec time: [0.02] s

  * igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_video_decode-instance-3-tile-0-system-memory:
    - Statuses : 1 dmesg-fail(s)
    - Exec time: [0.02] s

  * igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_video_decode-instance-4-tile-0-system-memory:
    - Statuses : 1 dmesg-fail(s)
    - Exec time: [0.02] s

  * igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_video_decode-instance-5-tile-0-system-memory:
    - Statuses : 1 dmesg-fail(s)
    - Exec time: [0.02] s

  * igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_video_decode-instance-6-tile-0-system-memory:
    - Statuses : 1 dmesg-fail(s)
    - Exec time: [0.01] s

  * igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_video_decode-instance-7-tile-0-system-memory:
    - Statuses : 1 dmesg-fail(s)
    - Exec time: [0.01] s

  * igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_video_enhance-instance-2-tile-0-system-memory:
    - Statuses : 1 dmesg-fail(s)
    - Exec time: [0.01] s

  * igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_video_enhance-instance-3-tile-0-system-memory:
    - Statuses : 1 dmesg-fail(s)
    - Exec time: [0.01] s

  

Known issues
------------

  Here are the changes found in xe-pw-139215v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_evict@evict-beng-small:
    - bat-adlp-7:         NOTRUN -> [SKIP][24] ([Intel XE#261] / [Intel XE#688]) +15 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139215v1/bat-adlp-7/igt@xe_evict@evict-beng-small.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:
    - bat-adlp-7:         NOTRUN -> [SKIP][25] ([Intel XE#288]) +32 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139215v1/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html

  * igt@xe_exec_threads@threads-basic:
    - bat-adlp-vf:        [PASS][26] -> [INCOMPLETE][27] ([Intel XE#1169]) +1 other test incomplete
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/bat-adlp-vf/igt@xe_exec_threads@threads-basic.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139215v1/bat-adlp-vf/igt@xe_exec_threads@threads-basic.html

  * igt@xe_live_ktest@xe_bo:
    - bat-adlp-vf:        [PASS][28] -> [SKIP][29] ([Intel XE#1192]) +2 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139215v1/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
    - bat-dg2-oem2:       [PASS][30] -> [INCOMPLETE][31] ([Intel XE#2874]) +1 other test incomplete
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139215v1/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html

  * igt@xe_live_ktest@xe_migrate:
    - bat-adlp-7:         NOTRUN -> [SKIP][32] ([Intel XE#1192]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139215v1/bat-adlp-7/igt@xe_live_ktest@xe_migrate.html
    - bat-atsm-2:         [PASS][33] -> [SKIP][34] ([Intel XE#1192]) +2 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139215v1/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html

  
#### Possible fixes ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [FAIL][35] ([Intel XE#1861]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139215v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  
#### Warnings ####

  * igt@xe_live_ktest@xe_bo:
    - bat-adlp-7:         [INCOMPLETE][37] ([Intel XE#2874]) -> [SKIP][38] ([Intel XE#1192])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/bat-adlp-7/igt@xe_live_ktest@xe_bo.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139215v1/bat-adlp-7/igt@xe_live_ktest@xe_bo.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1169]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688


Build changes
-------------

  * Linux: xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b -> xe-pw-139215v1

  IGT_8035: 54cf84790112f2656b38b9068d4b492fbef13d84 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b: 4d4fdd11d1cc941f2f7c1653fc07519851d9052b
  xe-pw-139215v1: 139215v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139215v1/index.html

--===============5716968628556726534==
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
<tr><td><b>Series:</b></td><td>drm/xe: Fix flickering when inheriting BIOS fb.</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/139215/">https://patchwork.freedesktop.org/series/139215/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139215v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139215v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b_BAT -&gt; xe-pw-139215v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-139215v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-139215v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-139215v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139215v1/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/bat-adlp-vf/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139215v1/bat-adlp-vf/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/bat-adlp-7/igt@sriov_basic@enable-vfs-autoprobe-on.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139215v1/bat-adlp-7/igt@sriov_basic@enable-vfs-autoprobe-on.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139215v1/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_video_enhance-instance-1-tile-0-system-memory:</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139215v1/bat-adlp-vf/igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_video_enhance-instance-1-tile-0-system-memory.html">DMESG-FAIL</a> +17 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-basic:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/bat-adlp-vf/igt@xe_exec_basic@twice-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139215v1/bat-adlp-vf/igt@xe_exec_basic@twice-basic.html">DMESG-FAIL</a> +49 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139215v1/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/bat-lnl-1/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139215v1/bat-lnl-1/igt@xe_module_load@load.html">ABORT</a></li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/bat-lnl-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139215v1/bat-lnl-2/igt@xe_module_load@load.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@bind-execqueues-independent:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/bat-adlp-vf/igt@xe_vm@bind-execqueues-independent.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139215v1/bat-adlp-vf/igt@xe_vm@bind-execqueues-independent.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>{bat-bmg-2}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139215v1/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>{bat-bmg-2}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/bat-bmg-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139215v1/bat-bmg-2/igt@xe_module_load@load.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b_BAT and xe-pw-139215v1_BAT:</p>
<h3>New IGT tests (16)</h3>
<ul>
<li>
<p>igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_video_decode-instance-2-tile-0-system-memory:</p>
<ul>
<li>Statuses : 1 dmesg-fail(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_video_decode-instance-3-tile-0-system-memory:</p>
<ul>
<li>Statuses : 1 dmesg-fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_video_decode-instance-4-tile-0-system-memory:</p>
<ul>
<li>Statuses : 1 dmesg-fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_video_decode-instance-5-tile-0-system-memory:</p>
<ul>
<li>Statuses : 1 dmesg-fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_video_decode-instance-6-tile-0-system-memory:</p>
<ul>
<li>Statuses : 1 dmesg-fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_video_decode-instance-7-tile-0-system-memory:</p>
<ul>
<li>Statuses : 1 dmesg-fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_video_enhance-instance-2-tile-0-system-memory:</p>
<ul>
<li>Statuses : 1 dmesg-fail(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_video_enhance-instance-3-tile-0-system-memory:</p>
<ul>
<li>Statuses : 1 dmesg-fail(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_video_decode-instance-2-tile-0-system-memory:</p>
<ul>
<li>Statuses : 1 dmesg-fail(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_video_decode-instance-3-tile-0-system-memory:</p>
<ul>
<li>Statuses : 1 dmesg-fail(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_video_decode-instance-4-tile-0-system-memory:</p>
<ul>
<li>Statuses : 1 dmesg-fail(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_video_decode-instance-5-tile-0-system-memory:</p>
<ul>
<li>Statuses : 1 dmesg-fail(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_video_decode-instance-6-tile-0-system-memory:</p>
<ul>
<li>Statuses : 1 dmesg-fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_video_decode-instance-7-tile-0-system-memory:</p>
<ul>
<li>Statuses : 1 dmesg-fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_video_enhance-instance-2-tile-0-system-memory:</p>
<ul>
<li>Statuses : 1 dmesg-fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_video_enhance-instance-3-tile-0-system-memory:</p>
<ul>
<li>Statuses : 1 dmesg-fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-139215v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_evict@evict-beng-small:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139215v1/bat-adlp-7/igt@xe_evict@evict-beng-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139215v1/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-basic:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/bat-adlp-vf/igt@xe_exec_threads@threads-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139215v1/bat-adlp-vf/igt@xe_exec_threads@threads-basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169">Intel XE#1169</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139215v1/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139215v1/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874">Intel XE#2874</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139215v1/bat-adlp-7/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +1 other test skip</li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139215v1/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@basic:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139215v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_live_ktest@xe_bo:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b/bat-adlp-7/igt@xe_live_ktest@xe_bo.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874">Intel XE#2874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139215v1/bat-adlp-7/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b -&gt; xe-pw-139215v1</li>
</ul>
<p>IGT_8035: 54cf84790112f2656b38b9068d4b492fbef13d84 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1984-4d4fdd11d1cc941f2f7c1653fc07519851d9052b: 4d4fdd11d1cc941f2f7c1653fc07519851d9052b<br />
  xe-pw-139215v1: 139215v1</p>

</body>
</html>

--===============5716968628556726534==--
