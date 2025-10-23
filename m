Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC591CCD1BF
	for <intel-xe@archiver.kernel.org>; Thu, 23 Oct 2025 22:31:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9214710E96F;
	Thu, 23 Oct 2025 22:31:13 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64E5E10E96F;
 Thu, 23 Oct 2025 22:31:12 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3692028079364614888=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/xe/uc=3A_Change_asserti?=
 =?utf-8?q?on_to_error_on_huc_authentication_failure?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 23 Oct 2025 22:31:12 -0000
Message-ID: <176125867240.48939.8471501180103272572@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251023181332.2490921-1-zhanjun.dong@intel.com>
In-Reply-To: <20251023181332.2490921-1-zhanjun.dong@intel.com>
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

--===============3692028079364614888==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/uc: Change assertion to error on huc authentication failure
URL   : https://patchwork.freedesktop.org/series/156439/
State : failure

== Summary ==

CI Bug Log - changes from xe-3974-c63ccee28ae7ab4cb57a2433314f08c71da914ff_BAT -> xe-pw-156439v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-156439v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-156439v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (11 -> 13)
------------------------------

  Additional (2): bat-pvc-2 bat-bmg-3 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-156439v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-lnl-2:          [PASS][1] -> [DMESG-WARN][2] +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3974-c63ccee28ae7ab4cb57a2433314f08c71da914ff/bat-lnl-2/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156439v1/bat-lnl-2/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1:
    - bat-adlp-7:         [PASS][3] -> [DMESG-WARN][4] +6 other tests dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3974-c63ccee28ae7ab4cb57a2433314f08c71da914ff/bat-adlp-7/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156439v1/bat-adlp-7/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1.html

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-edp-1:
    - bat-lnl-1:          [PASS][5] -> [DMESG-WARN][6] +5 other tests dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3974-c63ccee28ae7ab4cb57a2433314f08c71da914ff/bat-lnl-1/igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-edp-1.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156439v1/bat-lnl-1/igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-edp-1.html

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-edp-1:
    - bat-ptl-2:          [PASS][7] -> [DMESG-WARN][8] +6 other tests dmesg-warn
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3974-c63ccee28ae7ab4cb57a2433314f08c71da914ff/bat-ptl-2/igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-edp-1.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156439v1/bat-ptl-2/igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-edp-1.html

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-hdmi-a-3:
    - bat-bmg-1:          [PASS][9] -> [DMESG-WARN][10] +8 other tests dmesg-warn
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3974-c63ccee28ae7ab4cb57a2433314f08c71da914ff/bat-bmg-1/igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-hdmi-a-3.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156439v1/bat-bmg-1/igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-hdmi-a-3.html

  * igt@xe_live_ktest@xe_bo:
    - bat-pvc-2:          NOTRUN -> [DMESG-WARN][11] +3 other tests dmesg-warn
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156439v1/bat-pvc-2/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - bat-bmg-2:          [PASS][12] -> [DMESG-WARN][13] +3 other tests dmesg-warn
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3974-c63ccee28ae7ab4cb57a2433314f08c71da914ff/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156439v1/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  * igt@xe_module_load@load:
    - bat-dg2-oem2:       [PASS][14] -> [DMESG-WARN][15] +8 other tests dmesg-warn
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3974-c63ccee28ae7ab4cb57a2433314f08c71da914ff/bat-dg2-oem2/igt@xe_module_load@load.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156439v1/bat-dg2-oem2/igt@xe_module_load@load.html
    - bat-atsm-2:         [PASS][16] -> [DMESG-WARN][17] +4 other tests dmesg-warn
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3974-c63ccee28ae7ab4cb57a2433314f08c71da914ff/bat-atsm-2/igt@xe_module_load@load.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156439v1/bat-atsm-2/igt@xe_module_load@load.html
    - bat-ptl-1:          [PASS][18] -> [DMESG-WARN][19] +1 other test dmesg-warn
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3974-c63ccee28ae7ab4cb57a2433314f08c71da914ff/bat-ptl-1/igt@xe_module_load@load.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156439v1/bat-ptl-1/igt@xe_module_load@load.html

  
Known issues
------------

  Here are the changes found in xe-pw-156439v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@eof:
    - bat-pvc-2:          NOTRUN -> [SKIP][20] ([Intel XE#2134]) +4 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156439v1/bat-pvc-2/igt@fbdev@eof.html

  * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
    - bat-pvc-2:          NOTRUN -> [SKIP][21] ([i915#6077]) +30 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156439v1/bat-pvc-2/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:
    - bat-pvc-2:          NOTRUN -> [SKIP][22] ([Intel XE#1024] / [Intel XE#782]) +5 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156439v1/bat-pvc-2/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html

  * igt@kms_dsc@dsc-basic:
    - bat-pvc-2:          NOTRUN -> [SKIP][23] ([Intel XE#1024] / [Intel XE#784])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156439v1/bat-pvc-2/igt@kms_dsc@dsc-basic.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-pvc-2:          NOTRUN -> [SKIP][24] ([Intel XE#1024] / [Intel XE#947]) +3 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156439v1/bat-pvc-2/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_force_connector_basic@force-connector-state:
    - bat-pvc-2:          NOTRUN -> [SKIP][25] ([Intel XE#540]) +3 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156439v1/bat-pvc-2/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-pvc-2:          NOTRUN -> [SKIP][26] ([Intel XE#1024] / [Intel XE#783])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156439v1/bat-pvc-2/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence:
    - bat-pvc-2:          NOTRUN -> [SKIP][27] ([Intel XE#829]) +6 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156439v1/bat-pvc-2/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html

  * igt@kms_prop_blob@basic:
    - bat-pvc-2:          NOTRUN -> [SKIP][28] ([Intel XE#780])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156439v1/bat-pvc-2/igt@kms_prop_blob@basic.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - bat-pvc-2:          NOTRUN -> [SKIP][29] ([Intel XE#1024] / [Intel XE#1406]) +2 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156439v1/bat-pvc-2/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - bat-pvc-2:          NOTRUN -> [SKIP][30] ([Intel XE#2849]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156439v1/bat-pvc-2/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_create@multigpu-create-massive-size:
    - bat-bmg-3:          NOTRUN -> [SKIP][31] ([Intel XE#2504])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156439v1/bat-bmg-3/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_eudebug@multigpu-basic-client:
    - bat-bmg-3:          NOTRUN -> [SKIP][32] ([Intel XE#4837]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156439v1/bat-bmg-3/igt@xe_eudebug@multigpu-basic-client.html

  * igt@xe_gt_freq@freq_fixed_idle:
    - bat-pvc-2:          NOTRUN -> [SKIP][33] ([Intel XE#1021]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156439v1/bat-pvc-2/igt@xe_gt_freq@freq_fixed_idle.html

  * igt@xe_huc_copy@huc_copy:
    - bat-pvc-2:          NOTRUN -> [SKIP][34] ([Intel XE#255])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156439v1/bat-pvc-2/igt@xe_huc_copy@huc_copy.html

  * igt@xe_intel_bb@render:
    - bat-pvc-2:          NOTRUN -> [SKIP][35] ([Intel XE#532])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156439v1/bat-pvc-2/igt@xe_intel_bb@render.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - bat-pvc-2:          NOTRUN -> [SKIP][36] ([Intel XE#2229]) +1 other test skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156439v1/bat-pvc-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_pat@pat-index-xe2:
    - bat-pvc-2:          NOTRUN -> [SKIP][37] ([Intel XE#977]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156439v1/bat-pvc-2/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xehpc@render:
    - bat-pvc-2:          NOTRUN -> [SKIP][38] ([Intel XE#4578])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156439v1/bat-pvc-2/igt@xe_pat@pat-index-xehpc@render.html

  * igt@xe_pat@pat-index-xelpg:
    - bat-pvc-2:          NOTRUN -> [SKIP][39] ([Intel XE#979])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156439v1/bat-pvc-2/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_peer2peer@read:
    - bat-bmg-3:          NOTRUN -> [FAIL][40] ([Intel XE#6433]) +3 other tests fail
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156439v1/bat-bmg-3/igt@xe_peer2peer@read.html

  * igt@xe_pm_residency@gt-c6-on-idle:
    - bat-pvc-2:          NOTRUN -> [SKIP][41] ([Intel XE#531])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156439v1/bat-pvc-2/igt@xe_pm_residency@gt-c6-on-idle.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - bat-pvc-2:          NOTRUN -> [SKIP][42] ([Intel XE#3342])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156439v1/bat-pvc-2/igt@xe_sriov_flr@flr-vf1-clear.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1021
  [Intel XE#1024]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#4578]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4578
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#531]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/531
  [Intel XE#532]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/532
  [Intel XE#540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/540
  [Intel XE#6433]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6433
  [Intel XE#780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/780
  [Intel XE#782]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/782
  [Intel XE#783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/783
  [Intel XE#784]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/784
  [Intel XE#829]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/829
  [Intel XE#947]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/947
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#6077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6077


Build changes
-------------

  * Linux: xe-3974-c63ccee28ae7ab4cb57a2433314f08c71da914ff -> xe-pw-156439v1

  IGT_8596: 8596
  xe-3974-c63ccee28ae7ab4cb57a2433314f08c71da914ff: c63ccee28ae7ab4cb57a2433314f08c71da914ff
  xe-pw-156439v1: 156439v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156439v1/index.html

--===============3692028079364614888==
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
<tr><td><b>Series:</b></td><td>drm/xe/uc: Change assertion to error on huc authentication failure</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/156439/">https://patchwork.freedesktop.org/series/156439/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156439v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156439v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3974-c63ccee28ae7ab4cb57a2433314f08c71da914ff_BAT -&gt; xe-pw-156439v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-156439v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-156439v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (11 -&gt; 13)</h2>
<p>Additional (2): bat-pvc-2 bat-bmg-3 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-156439v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3974-c63ccee28ae7ab4cb57a2433314f08c71da914ff/bat-lnl-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156439v1/bat-lnl-2/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3974-c63ccee28ae7ab4cb57a2433314f08c71da914ff/bat-adlp-7/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156439v1/bat-adlp-7/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1.html">DMESG-WARN</a> +6 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-edp-1:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3974-c63ccee28ae7ab4cb57a2433314f08c71da914ff/bat-lnl-1/igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156439v1/bat-lnl-1/igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-edp-1.html">DMESG-WARN</a> +5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-edp-1:</p>
<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3974-c63ccee28ae7ab4cb57a2433314f08c71da914ff/bat-ptl-2/igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156439v1/bat-ptl-2/igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-edp-1.html">DMESG-WARN</a> +6 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-hdmi-a-3:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3974-c63ccee28ae7ab4cb57a2433314f08c71da914ff/bat-bmg-1/igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-hdmi-a-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156439v1/bat-bmg-1/igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-hdmi-a-3.html">DMESG-WARN</a> +8 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156439v1/bat-pvc-2/igt@xe_live_ktest@xe_bo.html">DMESG-WARN</a> +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3974-c63ccee28ae7ab4cb57a2433314f08c71da914ff/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156439v1/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">DMESG-WARN</a> +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3974-c63ccee28ae7ab4cb57a2433314f08c71da914ff/bat-dg2-oem2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156439v1/bat-dg2-oem2/igt@xe_module_load@load.html">DMESG-WARN</a> +8 other tests dmesg-warn</li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3974-c63ccee28ae7ab4cb57a2433314f08c71da914ff/bat-atsm-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156439v1/bat-atsm-2/igt@xe_module_load@load.html">DMESG-WARN</a> +4 other tests dmesg-warn</li>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3974-c63ccee28ae7ab4cb57a2433314f08c71da914ff/bat-ptl-1/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156439v1/bat-ptl-1/igt@xe_module_load@load.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-156439v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156439v1/bat-pvc-2/igt@fbdev@eof.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-legacy:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156439v1/bat-pvc-2/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6077">i915#6077</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156439v1/bat-pvc-2/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/782">Intel XE#782</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156439v1/bat-pvc-2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/784">Intel XE#784</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156439v1/bat-pvc-2/igt@kms_flip@basic-flip-vs-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/947">Intel XE#947</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156439v1/bat-pvc-2/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/540">Intel XE#540</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156439v1/bat-pvc-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/783">Intel XE#783</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156439v1/bat-pvc-2/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_prop_blob@basic:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156439v1/bat-pvc-2/igt@kms_prop_blob@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/780">Intel XE#780</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156439v1/bat-pvc-2/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156439v1/bat-pvc-2/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>bat-bmg-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156439v1/bat-bmg-3/igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504">Intel XE#2504</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@multigpu-basic-client:</p>
<ul>
<li>bat-bmg-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156439v1/bat-bmg-3/igt@xe_eudebug@multigpu-basic-client.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_fixed_idle:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156439v1/bat-pvc-2/igt@xe_gt_freq@freq_fixed_idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1021">Intel XE#1021</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156439v1/bat-pvc-2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@render:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156439v1/bat-pvc-2/igt@xe_intel_bb@render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/532">Intel XE#532</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156439v1/bat-pvc-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156439v1/bat-pvc-2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc@render:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156439v1/bat-pvc-2/igt@xe_pat@pat-index-xehpc@render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4578">Intel XE#4578</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156439v1/bat-pvc-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>bat-bmg-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156439v1/bat-bmg-3/igt@xe_peer2peer@read.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6433">Intel XE#6433</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-on-idle:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156439v1/bat-pvc-2/igt@xe_pm_residency@gt-c6-on-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/531">Intel XE#531</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156439v1/bat-pvc-2/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3974-c63ccee28ae7ab4cb57a2433314f08c71da914ff -&gt; xe-pw-156439v1</li>
</ul>
<p>IGT_8596: 8596<br />
  xe-3974-c63ccee28ae7ab4cb57a2433314f08c71da914ff: c63ccee28ae7ab4cb57a2433314f08c71da914ff<br />
  xe-pw-156439v1: 156439v1</p>

</body>
</html>

--===============3692028079364614888==--
