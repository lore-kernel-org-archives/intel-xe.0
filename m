Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC0BFC624A4
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 16:27:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ECE610E9EB;
	Mon, 31 Aug 2026 16:27:41 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB9FB10E2E8;
 Mon, 31 Aug 2026 16:27:39 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8523582094097820469=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_drm/xe/vf=3A_Retry_GuC_sta?=
 =?utf-8?q?te_reset_until_timeout?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lukasz Laguna" <lukasz.laguna@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 31 Aug 2026 16:27:39 -0000
Message-ID: <178819365989.101634.11496996093286260700@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260831092118.488317-1-lukasz.laguna@intel.com>
In-Reply-To: <20260831092118.488317-1-lukasz.laguna@intel.com>
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

--===============8523582094097820469==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/vf: Retry GuC state reset until timeout
URL   : https://patchwork.freedesktop.org/series/173046/
State : success

== Summary ==

CI Bug Log - changes from xe-5662-aa389a514292b196ae89c6515568b3329abeec63_FULL -> xe-pw-173046v1_FULL
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

  Here are the changes found in xe-pw-173046v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_bw@linear-tiling-4-displays-target-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][1] ([Intel XE#367])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173046v1/shard-bmg-1/igt@kms_bw@linear-tiling-4-displays-target-2160x1440p.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank@bc-dp2-hdmi-a3:
    - shard-bmg:          [PASS][2] -> [FAIL][3] ([Intel XE#6266]) +1 other test fail
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5662-aa389a514292b196ae89c6515568b3329abeec63/shard-bmg-7/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@bc-dp2-hdmi-a3.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173046v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@bc-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [PASS][4] -> [FAIL][5] ([Intel XE#301]) +1 other test fail
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5662-aa389a514292b196ae89c6515568b3329abeec63/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173046v1/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [PASS][6] -> [SKIP][7] ([Intel XE#1503])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5662-aa389a514292b196ae89c6515568b3329abeec63/shard-bmg-7/igt@kms_hdr@invalid-hdr.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173046v1/shard-bmg-5/igt@kms_hdr@invalid-hdr.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-lnl:          [PASS][8] -> [FAIL][9] ([Intel XE#2029] / [Intel XE#7395])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5662-aa389a514292b196ae89c6515568b3329abeec63/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173046v1/shard-lnl-8/igt@kms_pm_dc@deep-pkgc.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_pcode_probe_early:
    - shard-bmg:          [PASS][10] -> [ABORT][11] ([Intel XE#8007])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5662-aa389a514292b196ae89c6515568b3329abeec63/shard-bmg-10/igt@xe_fault_injection@inject-fault-probe-function-xe_pcode_probe_early.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173046v1/shard-bmg-8/igt@xe_fault_injection@inject-fault-probe-function-xe_pcode_probe_early.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotreplug-lateclose:
    - shard-bmg:          [ABORT][12] ([Intel XE#8007]) -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5662-aa389a514292b196ae89c6515568b3329abeec63/shard-bmg-9/igt@core_hotunplug@hotreplug-lateclose.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173046v1/shard-bmg-1/igt@core_hotunplug@hotreplug-lateclose.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-bmg:          [FAIL][14] ([Intel XE#3718] / [Intel XE#6078]) -> [PASS][15]
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5662-aa389a514292b196ae89c6515568b3329abeec63/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173046v1/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-2:
    - shard-bmg:          [FAIL][16] ([Intel XE#6078]) -> [PASS][17]
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5662-aa389a514292b196ae89c6515568b3329abeec63/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-2.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173046v1/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-2.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@b-edp1:
    - shard-lnl:          [FAIL][18] ([Intel XE#5408] / [Intel XE#6266]) -> [PASS][19] +1 other test pass
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5662-aa389a514292b196ae89c6515568b3329abeec63/shard-lnl-2/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-edp1.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173046v1/shard-lnl-2/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-edp1.html

  * igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race:
    - shard-bmg:          [FAIL][20] -> [PASS][21]
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5662-aa389a514292b196ae89c6515568b3329abeec63/shard-bmg-2/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173046v1/shard-bmg-4/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html

  * igt@xe_pmu@engine-activity-accuracy-50:
    - shard-bmg:          [FAIL][22] ([Intel XE#8555]) -> [PASS][23] +2 other tests pass
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5662-aa389a514292b196ae89c6515568b3329abeec63/shard-bmg-9/igt@xe_pmu@engine-activity-accuracy-50.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173046v1/shard-bmg-3/igt@xe_pmu@engine-activity-accuracy-50.html

  
#### Warnings ####

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-lnl:          [SKIP][24] ([Intel XE#309] / [Intel XE#7343] / [Intel XE#7935]) -> [SKIP][25] ([Intel XE#309] / [Intel XE#7343])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5662-aa389a514292b196ae89c6515568b3329abeec63/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173046v1/shard-lnl-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@xe_wedged@basic-wedged:
    - shard-lnl:          [DMESG-WARN][26] ([Intel XE#8963]) -> [ABORT][27] ([Intel XE#8963])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5662-aa389a514292b196ae89c6515568b3329abeec63/shard-lnl-6/igt@xe_wedged@basic-wedged.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173046v1/shard-lnl-4/igt@xe_wedged@basic-wedged.html

  
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#5408]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5408
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#6266]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7395]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7395
  [Intel XE#7935]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8555]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8555
  [Intel XE#8963]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8963


Build changes
-------------

  * Linux: xe-5662-aa389a514292b196ae89c6515568b3329abeec63 -> xe-pw-173046v1

  IGT_9078: 9078
  xe-5662-aa389a514292b196ae89c6515568b3329abeec63: aa389a514292b196ae89c6515568b3329abeec63
  xe-pw-173046v1: 173046v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173046v1/index.html

--===============8523582094097820469==
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
<tr><td><b>Series:</b></td><td>drm/xe/vf: Retry GuC state reset until timeout</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/173046/">https://patchwork.freedesktop.org/series/173046/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173046v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173046v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5662-aa389a514292b196ae89c6515568b3329abeec63_FULL -&gt; xe-pw-173046v1_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-173046v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-target-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173046v1/shard-bmg-1/igt@kms_bw@linear-tiling-4-displays-target-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5662-aa389a514292b196ae89c6515568b3329abeec63/shard-bmg-7/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@bc-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173046v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@bc-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266">Intel XE#6266</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5662-aa389a514292b196ae89c6515568b3329abeec63/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173046v1/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5662-aa389a514292b196ae89c6515568b3329abeec63/shard-bmg-7/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173046v1/shard-bmg-5/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5662-aa389a514292b196ae89c6515568b3329abeec63/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173046v1/shard-lnl-8/igt@kms_pm_dc@deep-pkgc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029">Intel XE#2029</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7395">Intel XE#7395</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_pcode_probe_early:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5662-aa389a514292b196ae89c6515568b3329abeec63/shard-bmg-10/igt@xe_fault_injection@inject-fault-probe-function-xe_pcode_probe_early.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173046v1/shard-bmg-8/igt@xe_fault_injection@inject-fault-probe-function-xe_pcode_probe_early.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug-lateclose:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5662-aa389a514292b196ae89c6515568b3329abeec63/shard-bmg-9/igt@core_hotunplug@hotreplug-lateclose.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173046v1/shard-bmg-1/igt@core_hotunplug@hotreplug-lateclose.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5662-aa389a514292b196ae89c6515568b3329abeec63/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173046v1/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5662-aa389a514292b196ae89c6515568b3329abeec63/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173046v1/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5662-aa389a514292b196ae89c6515568b3329abeec63/shard-lnl-2/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5408">Intel XE#5408</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266">Intel XE#6266</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173046v1/shard-lnl-2/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5662-aa389a514292b196ae89c6515568b3329abeec63/shard-bmg-2/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173046v1/shard-bmg-4/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-50:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5662-aa389a514292b196ae89c6515568b3329abeec63/shard-bmg-9/igt@xe_pmu@engine-activity-accuracy-50.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8555">Intel XE#8555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173046v1/shard-bmg-3/igt@xe_pmu@engine-activity-accuracy-50.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5662-aa389a514292b196ae89c6515568b3329abeec63/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935">Intel XE#7935</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173046v1/shard-lnl-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5662-aa389a514292b196ae89c6515568b3329abeec63/shard-lnl-6/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8963">Intel XE#8963</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-173046v1/shard-lnl-4/igt@xe_wedged@basic-wedged.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8963">Intel XE#8963</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5662-aa389a514292b196ae89c6515568b3329abeec63 -&gt; xe-pw-173046v1</li>
</ul>
<p>IGT_9078: 9078<br />
  xe-5662-aa389a514292b196ae89c6515568b3329abeec63: aa389a514292b196ae89c6515568b3329abeec63<br />
  xe-pw-173046v1: 173046v1</p>

</body>
</html>

--===============8523582094097820469==--
