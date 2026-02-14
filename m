Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCA64EF99E9
	for <intel-xe@archiver.kernel.org>; Sat, 14 Feb 2026 00:20:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68D5410E849;
	Sat, 14 Feb 2026 00:20:06 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D677710E844;
 Sat, 14 Feb 2026 00:20:05 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7636060487161923694=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_Low_hanging_pagefault_refa?=
 =?utf-8?q?ctors?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 14 Feb 2026 00:20:05 -0000
Message-ID: <177102840585.253305.12615687749622196123@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260212204227.2764054-1-matthew.brost@intel.com>
In-Reply-To: <20260212204227.2764054-1-matthew.brost@intel.com>
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

--===============7636060487161923694==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Low hanging pagefault refactors
URL   : https://patchwork.freedesktop.org/series/161560/
State : failure

== Summary ==

CI Bug Log - changes from xe-4551-8a3c5ed4673e2028f1fbfc55bdf121e0647f1ca2_FULL -> xe-pw-161560v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-161560v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-161560v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-161560v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161560v1/shard-bmg-1/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@xe_pmu@engine-activity-accuracy-2@engine-drm_xe_engine_class_video_decode0:
    - shard-bmg:          [PASS][2] -> [DMESG-WARN][3]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4551-8a3c5ed4673e2028f1fbfc55bdf121e0647f1ca2/shard-bmg-10/igt@xe_pmu@engine-activity-accuracy-2@engine-drm_xe_engine_class_video_decode0.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161560v1/shard-bmg-3/igt@xe_pmu@engine-activity-accuracy-2@engine-drm_xe_engine_class_video_decode0.html

  * igt@xe_pmu@engine-activity-accuracy-2@engine-drm_xe_engine_class_video_decode1:
    - shard-bmg:          [PASS][4] -> [ABORT][5] +2 other tests abort
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4551-8a3c5ed4673e2028f1fbfc55bdf121e0647f1ca2/shard-bmg-10/igt@xe_pmu@engine-activity-accuracy-2@engine-drm_xe_engine_class_video_decode1.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161560v1/shard-bmg-3/igt@xe_pmu@engine-activity-accuracy-2@engine-drm_xe_engine_class_video_decode1.html

  
Known issues
------------

  Here are the changes found in xe-pw-161560v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotreplug:
    - shard-bmg:          [PASS][6] -> [ABORT][7] ([Intel XE#5545])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4551-8a3c5ed4673e2028f1fbfc55bdf121e0647f1ca2/shard-bmg-8/igt@core_hotunplug@hotreplug.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161560v1/shard-bmg-2/igt@core_hotunplug@hotreplug.html

  * igt@core_hotunplug@unbind-rebind:
    - shard-bmg:          [PASS][8] -> [ABORT][9] ([Intel XE#7249])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4551-8a3c5ed4673e2028f1fbfc55bdf121e0647f1ca2/shard-bmg-10/igt@core_hotunplug@unbind-rebind.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161560v1/shard-bmg-5/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-d-hdmi-a-3:
    - shard-bmg:          [PASS][10] -> [FAIL][11] ([Intel XE#6983]) +1 other test fail
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4551-8a3c5ed4673e2028f1fbfc55bdf121e0647f1ca2/shard-bmg-8/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-d-hdmi-a-3.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161560v1/shard-bmg-2/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2652] / [Intel XE#787]) +3 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161560v1/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2.html

  * igt@kms_content_protection@legacy-hdcp14@pipe-a-dp-1:
    - shard-bmg:          NOTRUN -> [FAIL][13] ([Intel XE#3304])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161560v1/shard-bmg-5/igt@kms_content_protection@legacy-hdcp14@pipe-a-dp-1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [PASS][14] -> [FAIL][15] ([Intel XE#301] / [Intel XE#3149]) +3 other tests fail
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4551-8a3c5ed4673e2028f1fbfc55bdf121e0647f1ca2/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161560v1/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          [PASS][16] -> [INCOMPLETE][17] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4551-8a3c5ed4673e2028f1fbfc55bdf121e0647f1ca2/shard-bmg-5/igt@kms_flip@flip-vs-suspend-interruptible.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161560v1/shard-bmg-9/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [PASS][18] -> [FAIL][19] ([Intel XE#4459]) +1 other test fail
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4551-8a3c5ed4673e2028f1fbfc55bdf121e0647f1ca2/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161560v1/shard-lnl-1/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@xe_pm@s3-exec-after:
    - shard-bmg:          [PASS][20] -> [DMESG-WARN][21] ([Intel XE#3428])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4551-8a3c5ed4673e2028f1fbfc55bdf121e0647f1ca2/shard-bmg-6/igt@xe_pm@s3-exec-after.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161560v1/shard-bmg-3/igt@xe_pm@s3-exec-after.html

  
#### Possible fixes ####

  * igt@xe_pm_residency@aspm_link_residency:
    - shard-bmg:          [SKIP][22] -> [PASS][23]
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4551-8a3c5ed4673e2028f1fbfc55bdf121e0647f1ca2/shard-bmg-6/igt@xe_pm_residency@aspm_link_residency.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161560v1/shard-bmg-1/igt@xe_pm_residency@aspm_link_residency.html

  
#### Warnings ####

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][24] ([Intel XE#2509]) -> [SKIP][25] ([Intel XE#2426])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4551-8a3c5ed4673e2028f1fbfc55bdf121e0647f1ca2/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161560v1/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-bmg:          [ABORT][26] ([Intel XE#5466] / [Intel XE#6652]) -> [ABORT][27] ([Intel XE#5466])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4551-8a3c5ed4673e2028f1fbfc55bdf121e0647f1ca2/shard-bmg-2/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161560v1/shard-bmg-3/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#5466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#6652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652
  [Intel XE#6983]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6983
  [Intel XE#7249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7249
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787


Build changes
-------------

  * Linux: xe-4551-8a3c5ed4673e2028f1fbfc55bdf121e0647f1ca2 -> xe-pw-161560v1

  IGT_8753: 8753
  xe-4551-8a3c5ed4673e2028f1fbfc55bdf121e0647f1ca2: 8a3c5ed4673e2028f1fbfc55bdf121e0647f1ca2
  xe-pw-161560v1: 161560v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161560v1/index.html

--===============7636060487161923694==
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
<tr><td><b>Series:</b></td><td>Low hanging pagefault refactors</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/161560/">https://patchwork.freedesktop.org/series/161560/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161560v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161560v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4551-8a3c5ed4673e2028f1fbfc55bdf121e0647f1ca2_FULL -&gt; xe-pw-161560v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-161560v1_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-161560v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-161560v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161560v1/shard-bmg-1/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-2@engine-drm_xe_engine_class_video_decode0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4551-8a3c5ed4673e2028f1fbfc55bdf121e0647f1ca2/shard-bmg-10/igt@xe_pmu@engine-activity-accuracy-2@engine-drm_xe_engine_class_video_decode0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161560v1/shard-bmg-3/igt@xe_pmu@engine-activity-accuracy-2@engine-drm_xe_engine_class_video_decode0.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-2@engine-drm_xe_engine_class_video_decode1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4551-8a3c5ed4673e2028f1fbfc55bdf121e0647f1ca2/shard-bmg-10/igt@xe_pmu@engine-activity-accuracy-2@engine-drm_xe_engine_class_video_decode1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161560v1/shard-bmg-3/igt@xe_pmu@engine-activity-accuracy-2@engine-drm_xe_engine_class_video_decode1.html">ABORT</a> +2 other tests abort</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-161560v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4551-8a3c5ed4673e2028f1fbfc55bdf121e0647f1ca2/shard-bmg-8/igt@core_hotunplug@hotreplug.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161560v1/shard-bmg-2/igt@core_hotunplug@hotreplug.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a>)</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4551-8a3c5ed4673e2028f1fbfc55bdf121e0647f1ca2/shard-bmg-10/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161560v1/shard-bmg-5/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7249">Intel XE#7249</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4551-8a3c5ed4673e2028f1fbfc55bdf121e0647f1ca2/shard-bmg-8/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-d-hdmi-a-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161560v1/shard-bmg-2/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-d-hdmi-a-3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6983">Intel XE#6983</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161560v1/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy-hdcp14@pipe-a-dp-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161560v1/shard-bmg-5/igt@kms_content_protection@legacy-hdcp14@pipe-a-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4551-8a3c5ed4673e2028f1fbfc55bdf121e0647f1ca2/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161560v1/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4551-8a3c5ed4673e2028f1fbfc55bdf121e0647f1ca2/shard-bmg-5/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161560v1/shard-bmg-9/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4551-8a3c5ed4673e2028f1fbfc55bdf121e0647f1ca2/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161560v1/shard-lnl-1/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459">Intel XE#4459</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-exec-after:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4551-8a3c5ed4673e2028f1fbfc55bdf121e0647f1ca2/shard-bmg-6/igt@xe_pm@s3-exec-after.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161560v1/shard-bmg-3/igt@xe_pm@s3-exec-after.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428">Intel XE#3428</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_pm_residency@aspm_link_residency:<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4551-8a3c5ed4673e2028f1fbfc55bdf121e0647f1ca2/shard-bmg-6/igt@xe_pm_residency@aspm_link_residency.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161560v1/shard-bmg-1/igt@xe_pm_residency@aspm_link_residency.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4551-8a3c5ed4673e2028f1fbfc55bdf121e0647f1ca2/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161560v1/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4551-8a3c5ed4673e2028f1fbfc55bdf121e0647f1ca2/shard-bmg-2/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466">Intel XE#5466</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652">Intel XE#6652</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161560v1/shard-bmg-3/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466">Intel XE#5466</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4551-8a3c5ed4673e2028f1fbfc55bdf121e0647f1ca2 -&gt; xe-pw-161560v1</li>
</ul>
<p>IGT_8753: 8753<br />
  xe-4551-8a3c5ed4673e2028f1fbfc55bdf121e0647f1ca2: 8a3c5ed4673e2028f1fbfc55bdf121e0647f1ca2<br />
  xe-pw-161560v1: 161560v1</p>

</body>
</html>

--===============7636060487161923694==--
