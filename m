Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B28C7C44501
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jul 2026 02:50:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 611F110F1B3;
	Thu, 16 Jul 2026 02:50:46 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58A3210F1AF;
 Thu, 16 Jul 2026 02:50:45 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3315832651346886024=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_series_starting_with_=5B1/?=
 =?utf-8?q?2=5D_drm/xe/wopcm=3A_Use_the_size_from_HW_when_excluding_the_wopc?=
 =?utf-8?q?m_range_from_GGTT?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 16 Jul 2026 02:50:45 -0000
Message-ID: <178417024535.195369.230398955511668868@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260715232845.3644281-3-daniele.ceraolospurio@intel.com>
In-Reply-To: <20260715232845.3644281-3-daniele.ceraolospurio@intel.com>
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

--===============3315832651346886024==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/2] drm/xe/wopcm: Use the size from HW when excluding the wopcm range from GGTT
URL   : https://patchwork.freedesktop.org/series/170516/
State : failure

== Summary ==

CI Bug Log - changes from xe-5415-30d669bb45c300a1f1fc0f6201e14ad8679ef03c_FULL -> xe-pw-170516v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-170516v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-170516v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-170516v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:
    - shard-lnl:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5415-30d669bb45c300a1f1fc0f6201e14ad8679ef03c/shard-lnl-2/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170516v1/shard-lnl-2/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html

  * igt@xe_pmu@engine-activity-render-node-load:
    - shard-bmg:          [PASS][3] -> [ABORT][4] +35 other tests abort
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5415-30d669bb45c300a1f1fc0f6201e14ad8679ef03c/shard-bmg-10/igt@xe_pmu@engine-activity-render-node-load.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170516v1/shard-bmg-4/igt@xe_pmu@engine-activity-render-node-load.html

  
Known issues
------------

  Here are the changes found in xe-pw-170516v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [PASS][5] -> [FAIL][6] ([Intel XE#301])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5415-30d669bb45c300a1f1fc0f6201e14ad8679ef03c/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170516v1/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [PASS][7] -> [FAIL][8] ([Intel XE#301] / [Intel XE#3149])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5415-30d669bb45c300a1f1fc0f6201e14ad8679ef03c/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170516v1/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@xe_sriov_scheduling@nonpreempt-engine-resets-normal-priority@numvfs-random-gt0-rcs0:
    - shard-bmg:          [PASS][9] -> [ABORT][10] ([Intel XE#8007]) +3 other tests abort
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5415-30d669bb45c300a1f1fc0f6201e14ad8679ef03c/shard-bmg-7/igt@xe_sriov_scheduling@nonpreempt-engine-resets-normal-priority@numvfs-random-gt0-rcs0.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170516v1/shard-bmg-3/igt@xe_sriov_scheduling@nonpreempt-engine-resets-normal-priority@numvfs-random-gt0-rcs0.html

  * igt@xe_wedged@basic-wedged:
    - shard-bmg:          [PASS][11] -> [ABORT][12] ([Intel XE#8591])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5415-30d669bb45c300a1f1fc0f6201e14ad8679ef03c/shard-bmg-5/igt@xe_wedged@basic-wedged.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170516v1/shard-bmg-1/igt@xe_wedged@basic-wedged.html

  
#### Possible fixes ####

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [FAIL][13] ([Intel XE#301]) -> [PASS][14] +2 other tests pass
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5415-30d669bb45c300a1f1fc0f6201e14ad8679ef03c/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170516v1/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][15] ([Intel XE#1503]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5415-30d669bb45c300a1f1fc0f6201e14ad8679ef03c/shard-bmg-3/igt@kms_hdr@invalid-hdr.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170516v1/shard-bmg-8/igt@kms_hdr@invalid-hdr.html

  
#### Warnings ####

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-lnl:          [FAIL][17] ([Intel XE#301]) -> [FAIL][18] ([Intel XE#301] / [Intel XE#3149])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5415-30d669bb45c300a1f1fc0f6201e14ad8679ef03c/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170516v1/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][19] ([Intel XE#1729] / [Intel XE#7424]) -> [SKIP][20] ([Intel XE#2426] / [Intel XE#5848])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5415-30d669bb45c300a1f1fc0f6201e14ad8679ef03c/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170516v1/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern.html

  
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8591]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8591


Build changes
-------------

  * Linux: xe-5415-30d669bb45c300a1f1fc0f6201e14ad8679ef03c -> xe-pw-170516v1

  IGT_9007: 9007
  xe-5415-30d669bb45c300a1f1fc0f6201e14ad8679ef03c: 30d669bb45c300a1f1fc0f6201e14ad8679ef03c
  xe-pw-170516v1: 170516v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170516v1/index.html

--===============3315832651346886024==
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
<tr><td><b>Series:</b></td><td>series starting with [1/2] drm/xe/wopcm: Use the size from HW when excluding the wopcm range from GGTT</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/170516/">https://patchwork.freedesktop.org/series/170516/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170516v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170516v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5415-30d669bb45c300a1f1fc0f6201e14ad8679ef03c_FULL -&gt; xe-pw-170516v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-170516v1_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-170516v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-170516v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5415-30d669bb45c300a1f1fc0f6201e14ad8679ef03c/shard-lnl-2/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170516v1/shard-lnl-2/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-render-node-load:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5415-30d669bb45c300a1f1fc0f6201e14ad8679ef03c/shard-bmg-10/igt@xe_pmu@engine-activity-render-node-load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170516v1/shard-bmg-4/igt@xe_pmu@engine-activity-render-node-load.html">ABORT</a> +35 other tests abort</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-170516v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5415-30d669bb45c300a1f1fc0f6201e14ad8679ef03c/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170516v1/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5415-30d669bb45c300a1f1fc0f6201e14ad8679ef03c/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170516v1/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@nonpreempt-engine-resets-normal-priority@numvfs-random-gt0-rcs0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5415-30d669bb45c300a1f1fc0f6201e14ad8679ef03c/shard-bmg-7/igt@xe_sriov_scheduling@nonpreempt-engine-resets-normal-priority@numvfs-random-gt0-rcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170516v1/shard-bmg-3/igt@xe_sriov_scheduling@nonpreempt-engine-resets-normal-priority@numvfs-random-gt0-rcs0.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) +3 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5415-30d669bb45c300a1f1fc0f6201e14ad8679ef03c/shard-bmg-5/igt@xe_wedged@basic-wedged.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170516v1/shard-bmg-1/igt@xe_wedged@basic-wedged.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8591">Intel XE#8591</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5415-30d669bb45c300a1f1fc0f6201e14ad8679ef03c/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170516v1/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5415-30d669bb45c300a1f1fc0f6201e14ad8679ef03c/shard-bmg-3/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170516v1/shard-bmg-8/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5415-30d669bb45c300a1f1fc0f6201e14ad8679ef03c/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170516v1/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5415-30d669bb45c300a1f1fc0f6201e14ad8679ef03c/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">Intel XE#7424</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170516v1/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5415-30d669bb45c300a1f1fc0f6201e14ad8679ef03c -&gt; xe-pw-170516v1</li>
</ul>
<p>IGT_9007: 9007<br />
  xe-5415-30d669bb45c300a1f1fc0f6201e14ad8679ef03c: 30d669bb45c300a1f1fc0f6201e14ad8679ef03c<br />
  xe-pw-170516v1: 170516v1</p>

</body>
</html>

--===============3315832651346886024==--
