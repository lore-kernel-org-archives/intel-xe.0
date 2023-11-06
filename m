Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E33E8C4167D
	for <intel-xe@archiver.kernel.org>; Mon,  6 Nov 2023 12:10:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B83010E06F;
	Mon,  6 Nov 2023 12:10:05 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 669B810E06F;
 Mon,  6 Nov 2023 12:10:03 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 44103AADD6;
 Mon,  6 Nov 2023 12:10:03 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7381705612335926998=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mika Kuoppala" <mika.kuoppala@linux.intel.com>
Date: Mon, 06 Nov 2023 12:10:03 -0000
Message-ID: <169927260324.20423.8062924185456330593@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231106111845.2333093-1-mika.kuoppala@linux.intel.com>
In-Reply-To: <20231106111845.2333093-1-mika.kuoppala@linux.intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_xe-eudebu?=
 =?utf-8?q?g=3A_GPU_debugging_interface?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

--===============7381705612335926998==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: xe-eudebug: GPU debugging interface
URL   : https://patchwork.freedesktop.org/series/126019/
State : failure

== Summary ==

CI Bug Log - changes from xe-471-fc457bcc18109467961edc92c80b238009f6a9fb_BAT -> xe-pw-126019v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-126019v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-126019v1_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-126019v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-adlp-7:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-471-fc457bcc18109467961edc92c80b238009f6a9fb/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126019v1/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html

  * igt@xe_dma_buf_sync@export-dma-buf-once:
    - bat-pvc-2:          [PASS][3] -> [FAIL][4] +10 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-471-fc457bcc18109467961edc92c80b238009f6a9fb/bat-pvc-2/igt@xe_dma_buf_sync@export-dma-buf-once.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126019v1/bat-pvc-2/igt@xe_dma_buf_sync@export-dma-buf-once.html

  * igt@xe_exec_compute_mode@twice-userptr-invalidate:
    - bat-atsm-2:         [PASS][5] -> [FAIL][6] +100 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-471-fc457bcc18109467961edc92c80b238009f6a9fb/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126019v1/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html

  * igt@xe_intel_bb@create-in-region:
    - bat-adlp-7:         [PASS][7] -> [FAIL][8] +130 other tests fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-471-fc457bcc18109467961edc92c80b238009f6a9fb/bat-adlp-7/igt@xe_intel_bb@create-in-region.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126019v1/bat-adlp-7/igt@xe_intel_bb@create-in-region.html

  * igt@xe_intel_bb@intel-bb-blit-y:
    - bat-pvc-2:          NOTRUN -> [FAIL][9] +75 other tests fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126019v1/bat-pvc-2/igt@xe_intel_bb@intel-bb-blit-y.html

  
#### Warnings ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [DMESG-FAIL][10] ([Intel XE#282] / [i915#2017]) -> [FAIL][11]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-471-fc457bcc18109467961edc92c80b238009f6a9fb/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126019v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  * igt@xe_evict@evict-beng-small-external:
    - bat-pvc-2:          [FAIL][12] ([Intel XE#389]) -> [FAIL][13] +3 other tests fail
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-471-fc457bcc18109467961edc92c80b238009f6a9fb/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126019v1/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html

  * igt@xe_evict@evict-small-cm:
    - bat-pvc-2:          [DMESG-FAIL][14] ([Intel XE#482]) -> [FAIL][15] +3 other tests fail
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-471-fc457bcc18109467961edc92c80b238009f6a9fb/bat-pvc-2/igt@xe_evict@evict-small-cm.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126019v1/bat-pvc-2/igt@xe_evict@evict-small-cm.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@xe_evict_ccs@evict-ccs-overcommit-parallel-nofree-samefd}:
    - bat-pvc-2:          [INCOMPLETE][16] ([Intel XE#854]) -> [FAIL][17]
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-471-fc457bcc18109467961edc92c80b238009f6a9fb/bat-pvc-2/igt@xe_evict_ccs@evict-ccs-overcommit-parallel-nofree-samefd.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126019v1/bat-pvc-2/igt@xe_evict_ccs@evict-ccs-overcommit-parallel-nofree-samefd.html

  * {igt@xe_evict_ccs@evict-ccs-overcommit-simple}:
    - bat-pvc-2:          [PASS][18] -> [FAIL][19]
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-471-fc457bcc18109467961edc92c80b238009f6a9fb/bat-pvc-2/igt@xe_evict_ccs@evict-ccs-overcommit-simple.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126019v1/bat-pvc-2/igt@xe_evict_ccs@evict-ccs-overcommit-simple.html

  * {igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate}:
    - bat-pvc-2:          NOTRUN -> [FAIL][20] +11 other tests fail
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126019v1/bat-pvc-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html

  * {igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-rebind}:
    - bat-atsm-2:         [PASS][21] -> [FAIL][22] +13 other tests fail
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-471-fc457bcc18109467961edc92c80b238009f6a9fb/bat-atsm-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-rebind.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126019v1/bat-atsm-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-rebind.html

  * {igt@xe_vm@bind-execqueues-independent}:
    - bat-adlp-7:         [PASS][23] -> [FAIL][24] +11 other tests fail
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-471-fc457bcc18109467961edc92c80b238009f6a9fb/bat-adlp-7/igt@xe_vm@bind-execqueues-independent.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126019v1/bat-adlp-7/igt@xe_vm@bind-execqueues-independent.html

  
New tests
---------

  New tests have been introduced between xe-471-fc457bcc18109467961edc92c80b238009f6a9fb_BAT and xe-pw-126019v1_BAT:

### New IGT tests (1) ###

  * igt@xe_live_ktest:
    - Statuses :
    - Exec time: [None] s

  

Known issues
------------

  Here are the changes found in xe-pw-126019v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-atsm-2:         [PASS][25] -> [INCOMPLETE][26] ([Intel XE#764])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-471-fc457bcc18109467961edc92c80b238009f6a9fb/bat-atsm-2/igt@core_hotunplug@unbind-rebind.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126019v1/bat-atsm-2/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
    - bat-pvc-2:          NOTRUN -> [SKIP][27] ([i915#6077]) +33 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126019v1/bat-pvc-2/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
    - bat-pvc-2:          NOTRUN -> [SKIP][28] ([Intel XE#782]) +5 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126019v1/bat-pvc-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html

  * igt@kms_dsc@dsc-basic:
    - bat-pvc-2:          NOTRUN -> [SKIP][29] ([Intel XE#784])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126019v1/bat-pvc-2/igt@kms_dsc@dsc-basic.html

  * igt@kms_flip@basic-flip-vs-dpms:
    - bat-pvc-2:          NOTRUN -> [SKIP][30] ([Intel XE#541]) +3 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126019v1/bat-pvc-2/igt@kms_flip@basic-flip-vs-dpms.html

  * igt@kms_force_connector_basic@force-connector-state:
    - bat-pvc-2:          NOTRUN -> [SKIP][31] ([Intel XE#540]) +3 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126019v1/bat-pvc-2/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-pvc-2:          NOTRUN -> [SKIP][32] ([Intel XE#783])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126019v1/bat-pvc-2/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - bat-pvc-2:          NOTRUN -> [SKIP][33] ([Intel XE#829]) +6 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126019v1/bat-pvc-2/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  * igt@kms_prop_blob@basic:
    - bat-pvc-2:          NOTRUN -> [SKIP][34] ([Intel XE#780])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126019v1/bat-pvc-2/igt@kms_prop_blob@basic.html

  * igt@kms_psr@primary_page_flip:
    - bat-pvc-2:          NOTRUN -> [SKIP][35] ([Intel XE#535]) +2 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126019v1/bat-pvc-2/igt@kms_psr@primary_page_flip.html

  * igt@xe_guc_pc@freq_range_idle:
    - bat-pvc-2:          NOTRUN -> [SKIP][36] ([Intel XE#533]) +1 other test skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126019v1/bat-pvc-2/igt@xe_guc_pc@freq_range_idle.html

  * igt@xe_huc_copy@huc_copy:
    - bat-pvc-2:          NOTRUN -> [SKIP][37] ([Intel XE#255])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126019v1/bat-pvc-2/igt@xe_huc_copy@huc_copy.html

  * igt@xe_intel_bb@render:
    - bat-pvc-2:          NOTRUN -> [SKIP][38] ([Intel XE#532])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126019v1/bat-pvc-2/igt@xe_intel_bb@render.html

  * igt@xe_module_load@load:
    - bat-dg2-oem2:       [PASS][39] -> [INCOMPLETE][40] ([Intel XE#597] / [Intel XE#714])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-471-fc457bcc18109467961edc92c80b238009f6a9fb/bat-dg2-oem2/igt@xe_module_load@load.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126019v1/bat-dg2-oem2/igt@xe_module_load@load.html

  * igt@xe_pm_residency@gt-c6-on-idle:
    - bat-pvc-2:          NOTRUN -> [SKIP][41] ([Intel XE#531])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126019v1/bat-pvc-2/igt@xe_pm_residency@gt-c6-on-idle.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
  [Intel XE#389]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/389
  [Intel XE#482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/482
  [Intel XE#531]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/531
  [Intel XE#532]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/532
  [Intel XE#533]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/533
  [Intel XE#535]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/535
  [Intel XE#540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/540
  [Intel XE#541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/541
  [Intel XE#597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/597
  [Intel XE#714]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/714
  [Intel XE#764]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/764
  [Intel XE#780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/780
  [Intel XE#782]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/782
  [Intel XE#783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/783
  [Intel XE#784]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/784
  [Intel XE#829]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/829
  [Intel XE#854]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/854
  [i915#2017]: https://gitlab.freedesktop.org/drm/intel/issues/2017
  [i915#6077]: https://gitlab.freedesktop.org/drm/intel/issues/6077


Build changes
-------------

  * Linux: xe-471-fc457bcc18109467961edc92c80b238009f6a9fb -> xe-pw-126019v1

  IGT_7573: 69485d223b256208614e9949a4a7e84bde52d5f5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-471-fc457bcc18109467961edc92c80b238009f6a9fb: fc457bcc18109467961edc92c80b238009f6a9fb
  xe-pw-126019v1: 126019v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126019v1/index.html

--===============7381705612335926998==
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
<tr><td><b>Series:</b></td><td>xe-eudebug: GPU debugging interface</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/126019/">https://patchwork.freedesktop.org/series/126019/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126019v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126019v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-471-fc457bcc18109467961edc92c80b238009f6a9fb_BAT -&gt; xe-pw-126019v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-126019v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-126019v1_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-126019v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-471-fc457bcc18109467961edc92c80b238009f6a9fb/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126019v1/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_dma_buf_sync@export-dma-buf-once:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-471-fc457bcc18109467961edc92c80b238009f6a9fb/bat-pvc-2/igt@xe_dma_buf_sync@export-dma-buf-once.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126019v1/bat-pvc-2/igt@xe_dma_buf_sync@export-dma-buf-once.html">FAIL</a> +10 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-userptr-invalidate:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-471-fc457bcc18109467961edc92c80b238009f6a9fb/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126019v1/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html">FAIL</a> +100 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@create-in-region:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-471-fc457bcc18109467961edc92c80b238009f6a9fb/bat-adlp-7/igt@xe_intel_bb@create-in-region.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126019v1/bat-adlp-7/igt@xe_intel_bb@create-in-region.html">FAIL</a> +130 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@intel-bb-blit-y:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126019v1/bat-pvc-2/igt@xe_intel_bb@intel-bb-blit-y.html">FAIL</a> +75 other tests fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-471-fc457bcc18109467961edc92c80b238009f6a9fb/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2017">i915#2017</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126019v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-external:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-471-fc457bcc18109467961edc92c80b238009f6a9fb/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/389">Intel XE#389</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126019v1/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-cm:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-471-fc457bcc18109467961edc92c80b238009f6a9fb/bat-pvc-2/igt@xe_evict@evict-small-cm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/482">Intel XE#482</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126019v1/bat-pvc-2/igt@xe_evict@evict-small-cm.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@xe_evict_ccs@evict-ccs-overcommit-parallel-nofree-samefd}:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-471-fc457bcc18109467961edc92c80b238009f6a9fb/bat-pvc-2/igt@xe_evict_ccs@evict-ccs-overcommit-parallel-nofree-samefd.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/854">Intel XE#854</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126019v1/bat-pvc-2/igt@xe_evict_ccs@evict-ccs-overcommit-parallel-nofree-samefd.html">FAIL</a></li>
</ul>
</li>
<li>
<p>{igt@xe_evict_ccs@evict-ccs-overcommit-simple}:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-471-fc457bcc18109467961edc92c80b238009f6a9fb/bat-pvc-2/igt@xe_evict_ccs@evict-ccs-overcommit-simple.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126019v1/bat-pvc-2/igt@xe_evict_ccs@evict-ccs-overcommit-simple.html">FAIL</a></li>
</ul>
</li>
<li>
<p>{igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate}:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126019v1/bat-pvc-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html">FAIL</a> +11 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-rebind}:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-471-fc457bcc18109467961edc92c80b238009f6a9fb/bat-atsm-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126019v1/bat-atsm-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-rebind.html">FAIL</a> +13 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@xe_vm@bind-execqueues-independent}:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-471-fc457bcc18109467961edc92c80b238009f6a9fb/bat-adlp-7/igt@xe_vm@bind-execqueues-independent.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126019v1/bat-adlp-7/igt@xe_vm@bind-execqueues-independent.html">FAIL</a> +11 other tests fail</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-471-fc457bcc18109467961edc92c80b238009f6a9fb_BAT and xe-pw-126019v1_BAT:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@xe_live_ktest:<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-126019v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-471-fc457bcc18109467961edc92c80b238009f6a9fb/bat-atsm-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126019v1/bat-atsm-2/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/764">Intel XE#764</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-legacy:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126019v1/bat-pvc-2/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6077">i915#6077</a>) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126019v1/bat-pvc-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/782">Intel XE#782</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126019v1/bat-pvc-2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/784">Intel XE#784</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126019v1/bat-pvc-2/igt@kms_flip@basic-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/541">Intel XE#541</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126019v1/bat-pvc-2/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/540">Intel XE#540</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126019v1/bat-pvc-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/783">Intel XE#783</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126019v1/bat-pvc-2/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_prop_blob@basic:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126019v1/bat-pvc-2/igt@kms_prop_blob@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/780">Intel XE#780</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_page_flip:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126019v1/bat-pvc-2/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/535">Intel XE#535</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_guc_pc@freq_range_idle:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126019v1/bat-pvc-2/igt@xe_guc_pc@freq_range_idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/533">Intel XE#533</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126019v1/bat-pvc-2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@render:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126019v1/bat-pvc-2/igt@xe_intel_bb@render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/532">Intel XE#532</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-471-fc457bcc18109467961edc92c80b238009f6a9fb/bat-dg2-oem2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126019v1/bat-dg2-oem2/igt@xe_module_load@load.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/597">Intel XE#597</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/714">Intel XE#714</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-on-idle:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126019v1/bat-pvc-2/igt@xe_pm_residency@gt-c6-on-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/531">Intel XE#531</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-471-fc457bcc18109467961edc92c80b238009f6a9fb -&gt; xe-pw-126019v1</li>
</ul>
<p>IGT_7573: 69485d223b256208614e9949a4a7e84bde52d5f5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-471-fc457bcc18109467961edc92c80b238009f6a9fb: fc457bcc18109467961edc92c80b238009f6a9fb<br />
  xe-pw-126019v1: 126019v1</p>

</body>
</html>

--===============7381705612335926998==--
