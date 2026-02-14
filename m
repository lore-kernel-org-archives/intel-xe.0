Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6718EF99EA
	for <intel-xe@archiver.kernel.org>; Sat, 14 Feb 2026 01:07:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6771610E86A;
	Sat, 14 Feb 2026 01:07:35 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16AA110E86B;
 Sat, 14 Feb 2026 01:07:34 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8888073406518219392=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_Add_debugfs_facility_to_ca?=
 =?utf-8?q?tch_RTP_mistakes_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 14 Feb 2026 01:07:34 -0000
Message-ID: <177103125407.254191.11437874168762129573@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260213000929.732113-6-matthew.d.roper@intel.com>
In-Reply-To: <20260213000929.732113-6-matthew.d.roper@intel.com>
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

--===============8888073406518219392==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add debugfs facility to catch RTP mistakes (rev2)
URL   : https://patchwork.freedesktop.org/series/161517/
State : failure

== Summary ==

CI Bug Log - changes from xe-4551-8a3c5ed4673e2028f1fbfc55bdf121e0647f1ca2_FULL -> xe-pw-161517v2_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-161517v2_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-161517v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-161517v2_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_pm@s4-basic:
    - shard-lnl:          [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4551-8a3c5ed4673e2028f1fbfc55bdf121e0647f1ca2/shard-lnl-4/igt@xe_pm@s4-basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161517v2/shard-lnl-5/igt@xe_pm@s4-basic.html

  
Known issues
------------

  Here are the changes found in xe-pw-161517v2_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#2652] / [Intel XE#787]) +3 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161517v2/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2.html

  * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
    - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#2252])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161517v2/shard-bmg-7/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html

  * igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-1:
    - shard-bmg:          NOTRUN -> [FAIL][5] ([Intel XE#3304]) +1 other test fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161517v2/shard-bmg-5/igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-1.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [PASS][6] -> [FAIL][7] ([Intel XE#301]) +1 other test fail
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4551-8a3c5ed4673e2028f1fbfc55bdf121e0647f1ca2/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161517v2/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          [PASS][8] -> [INCOMPLETE][9] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4551-8a3c5ed4673e2028f1fbfc55bdf121e0647f1ca2/shard-bmg-5/igt@kms_flip@flip-vs-suspend-interruptible.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161517v2/shard-bmg-8/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [PASS][10] -> [SKIP][11] ([Intel XE#1503])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4551-8a3c5ed4673e2028f1fbfc55bdf121e0647f1ca2/shard-bmg-7/igt@kms_hdr@invalid-hdr.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161517v2/shard-bmg-4/igt@kms_hdr@invalid-hdr.html

  * igt@kms_setmode@basic:
    - shard-bmg:          [PASS][12] -> [FAIL][13] ([Intel XE#6361]) +3 other tests fail
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4551-8a3c5ed4673e2028f1fbfc55bdf121e0647f1ca2/shard-bmg-7/igt@kms_setmode@basic.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161517v2/shard-bmg-4/igt@kms_setmode@basic.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [PASS][14] -> [FAIL][15] ([Intel XE#4459]) +1 other test fail
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4551-8a3c5ed4673e2028f1fbfc55bdf121e0647f1ca2/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161517v2/shard-lnl-1/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:
    - shard-lnl:          [PASS][16] -> [FAIL][17] ([Intel XE#5625])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4551-8a3c5ed4673e2028f1fbfc55bdf121e0647f1ca2/shard-lnl-1/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161517v2/shard-lnl-5/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html

  * igt@xe_exec_threads@threads-multi-queue-fd-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#7138])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161517v2/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-fd-userptr-invalidate-race.html

  
#### Possible fixes ####

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [FAIL][19] ([Intel XE#6715]) -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4551-8a3c5ed4673e2028f1fbfc55bdf121e0647f1ca2/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161517v2/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][21] ([Intel XE#6321]) -> [PASS][22]
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4551-8a3c5ed4673e2028f1fbfc55bdf121e0647f1ca2/shard-bmg-9/igt@xe_evict@evict-mixed-many-threads-small.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161517v2/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_pm_residency@aspm_link_residency:
    - shard-bmg:          [SKIP][23] -> [PASS][24]
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4551-8a3c5ed4673e2028f1fbfc55bdf121e0647f1ca2/shard-bmg-6/igt@xe_pm_residency@aspm_link_residency.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161517v2/shard-bmg-1/igt@xe_pm_residency@aspm_link_residency.html

  
#### Warnings ####

  * igt@kms_cursor_legacy@short-flip-before-cursor-toggle:
    - shard-bmg:          [ABORT][25] ([Intel XE#2705] / [Intel XE#4760] / [Intel XE#7169]) -> [ABORT][26] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#4760] / [Intel XE#7169])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4551-8a3c5ed4673e2028f1fbfc55bdf121e0647f1ca2/shard-bmg-1/igt@kms_cursor_legacy@short-flip-before-cursor-toggle.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161517v2/shard-bmg-8/igt@kms_cursor_legacy@short-flip-before-cursor-toggle.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][27] ([Intel XE#3544]) -> [SKIP][28] ([Intel XE#3374] / [Intel XE#3544])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4551-8a3c5ed4673e2028f1fbfc55bdf121e0647f1ca2/shard-bmg-10/igt@kms_hdr@brightness-with-hdr.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161517v2/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-bmg:          [ABORT][29] ([Intel XE#5466] / [Intel XE#6652]) -> [ABORT][30] ([Intel XE#5466])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4551-8a3c5ed4673e2028f1fbfc55bdf121e0647f1ca2/shard-bmg-2/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161517v2/shard-bmg-3/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#4760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760
  [Intel XE#5466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466
  [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361
  [Intel XE#6652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652
  [Intel XE#6715]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6715
  [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
  [Intel XE#7169]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7169
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787


Build changes
-------------

  * Linux: xe-4551-8a3c5ed4673e2028f1fbfc55bdf121e0647f1ca2 -> xe-pw-161517v2

  IGT_8753: 8753
  xe-4551-8a3c5ed4673e2028f1fbfc55bdf121e0647f1ca2: 8a3c5ed4673e2028f1fbfc55bdf121e0647f1ca2
  xe-pw-161517v2: 161517v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161517v2/index.html

--===============8888073406518219392==
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
<tr><td><b>Series:</b></td><td>Add debugfs facility to catch RTP mistakes (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/161517/">https://patchwork.freedesktop.org/series/161517/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161517v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161517v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4551-8a3c5ed4673e2028f1fbfc55bdf121e0647f1ca2_FULL -&gt; xe-pw-161517v2_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-161517v2_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-161517v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-161517v2_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_pm@s4-basic:<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4551-8a3c5ed4673e2028f1fbfc55bdf121e0647f1ca2/shard-lnl-4/igt@xe_pm@s4-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161517v2/shard-lnl-5/igt@xe_pm@s4-basic.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-161517v2_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161517v2/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161517v2/shard-bmg-7/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161517v2/shard-bmg-5/igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4551-8a3c5ed4673e2028f1fbfc55bdf121e0647f1ca2/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161517v2/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4551-8a3c5ed4673e2028f1fbfc55bdf121e0647f1ca2/shard-bmg-5/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161517v2/shard-bmg-8/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4551-8a3c5ed4673e2028f1fbfc55bdf121e0647f1ca2/shard-bmg-7/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161517v2/shard-bmg-4/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4551-8a3c5ed4673e2028f1fbfc55bdf121e0647f1ca2/shard-bmg-7/igt@kms_setmode@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161517v2/shard-bmg-4/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361">Intel XE#6361</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4551-8a3c5ed4673e2028f1fbfc55bdf121e0647f1ca2/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161517v2/shard-lnl-1/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459">Intel XE#4459</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4551-8a3c5ed4673e2028f1fbfc55bdf121e0647f1ca2/shard-lnl-1/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161517v2/shard-lnl-5/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625">Intel XE#5625</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-fd-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161517v2/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-fd-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4551-8a3c5ed4673e2028f1fbfc55bdf121e0647f1ca2/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6715">Intel XE#6715</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161517v2/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4551-8a3c5ed4673e2028f1fbfc55bdf121e0647f1ca2/shard-bmg-9/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161517v2/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@aspm_link_residency:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4551-8a3c5ed4673e2028f1fbfc55bdf121e0647f1ca2/shard-bmg-6/igt@xe_pm_residency@aspm_link_residency.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161517v2/shard-bmg-1/igt@xe_pm_residency@aspm_link_residency.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@short-flip-before-cursor-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4551-8a3c5ed4673e2028f1fbfc55bdf121e0647f1ca2/shard-bmg-1/igt@kms_cursor_legacy@short-flip-before-cursor-toggle.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760">Intel XE#4760</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7169">Intel XE#7169</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161517v2/shard-bmg-8/igt@kms_cursor_legacy@short-flip-before-cursor-toggle.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760">Intel XE#4760</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7169">Intel XE#7169</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4551-8a3c5ed4673e2028f1fbfc55bdf121e0647f1ca2/shard-bmg-10/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161517v2/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4551-8a3c5ed4673e2028f1fbfc55bdf121e0647f1ca2/shard-bmg-2/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466">Intel XE#5466</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652">Intel XE#6652</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161517v2/shard-bmg-3/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466">Intel XE#5466</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4551-8a3c5ed4673e2028f1fbfc55bdf121e0647f1ca2 -&gt; xe-pw-161517v2</li>
</ul>
<p>IGT_8753: 8753<br />
  xe-4551-8a3c5ed4673e2028f1fbfc55bdf121e0647f1ca2: 8a3c5ed4673e2028f1fbfc55bdf121e0647f1ca2<br />
  xe-pw-161517v2: 161517v2</p>

</body>
</html>

--===============8888073406518219392==--
