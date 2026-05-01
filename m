Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBC85CD3424
	for <intel-xe@archiver.kernel.org>; Fri,  1 May 2026 09:25:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5443510E515;
	Fri,  1 May 2026 09:25:47 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2392F10E515;
 Fri,  1 May 2026 09:25:46 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0644382845555112966=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/xe/rtp=3A_Miscellaneou?=
 =?utf-8?q?s_improvements_to_rule_matching_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 01 May 2026 09:25:46 -0000
Message-ID: <177762754613.31620.1673285906864904765@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260430-rtp-rule-parser-v2-0-157e98b4ab51@intel.com>
In-Reply-To: <20260430-rtp-rule-parser-v2-0-157e98b4ab51@intel.com>
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

--===============0644382845555112966==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/rtp: Miscellaneous improvements to rule matching (rev2)
URL   : https://patchwork.freedesktop.org/series/160111/
State : failure

== Summary ==

CI Bug Log - changes from xe-4960-6472756e8384e3945f12b6726dd9dc1ac12f3bb4_FULL -> xe-pw-160111v2_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-160111v2_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-160111v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-160111v2_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_sharpness_filter@filter-formats@pipe-a-edp-1-nv12:
    - shard-lnl:          [PASS][1] -> [DMESG-WARN][2] +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4960-6472756e8384e3945f12b6726dd9dc1ac12f3bb4/shard-lnl-7/igt@kms_sharpness_filter@filter-formats@pipe-a-edp-1-nv12.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160111v2/shard-lnl-2/igt@kms_sharpness_filter@filter-formats@pipe-a-edp-1-nv12.html

  * igt@xe_evict@evict-threads-large:
    - shard-bmg:          [PASS][3] -> [TIMEOUT][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4960-6472756e8384e3945f12b6726dd9dc1ac12f3bb4/shard-bmg-6/igt@xe_evict@evict-threads-large.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160111v2/shard-bmg-7/igt@xe_evict@evict-threads-large.html

  
Known issues
------------

  Here are the changes found in xe-pw-160111v2_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-bmg:          [PASS][5] -> [FAIL][6] ([Intel XE#3718] / [Intel XE#6078])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4960-6472756e8384e3945f12b6726dd9dc1ac12f3bb4/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160111v2/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2:
    - shard-bmg:          [PASS][7] -> [FAIL][8] ([Intel XE#6078])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4960-6472756e8384e3945f12b6726dd9dc1ac12f3bb4/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160111v2/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [PASS][9] -> [INCOMPLETE][10] ([Intel XE#7084]) +1 other test incomplete
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4960-6472756e8384e3945f12b6726dd9dc1ac12f3bb4/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160111v2/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [PASS][11] -> [FAIL][12] ([Intel XE#7809])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4960-6472756e8384e3945f12b6726dd9dc1ac12f3bb4/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160111v2/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [PASS][13] -> [FAIL][14] ([Intel XE#301]) +1 other test fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4960-6472756e8384e3945f12b6726dd9dc1ac12f3bb4/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160111v2/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  
#### Possible fixes ####

  * igt@kms_cursor_edge_walk@256x256-top-edge@pipe-d-dp-2:
    - shard-bmg:          [FAIL][15] ([Intel XE#6841]) -> [PASS][16] +1 other test pass
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4960-6472756e8384e3945f12b6726dd9dc1ac12f3bb4/shard-bmg-2/igt@kms_cursor_edge_walk@256x256-top-edge@pipe-d-dp-2.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160111v2/shard-bmg-4/igt@kms_cursor_edge_walk@256x256-top-edge@pipe-d-dp-2.html

  * igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [DMESG-WARN][17] ([Intel XE#5354]) -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4960-6472756e8384e3945f12b6726dd9dc1ac12f3bb4/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160111v2/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [FAIL][19] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][20] +1 other test pass
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4960-6472756e8384e3945f12b6726dd9dc1ac12f3bb4/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160111v2/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][21] ([Intel XE#1503]) -> [PASS][22]
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4960-6472756e8384e3945f12b6726dd9dc1ac12f3bb4/shard-bmg-5/igt@kms_hdr@invalid-hdr.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160111v2/shard-bmg-8/igt@kms_hdr@invalid-hdr.html

  
#### Warnings ####

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][23] ([Intel XE#3544]) -> [SKIP][24] ([Intel XE#3374] / [Intel XE#3544])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4960-6472756e8384e3945f12b6726dd9dc1ac12f3bb4/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160111v2/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][25] ([Intel XE#1729] / [Intel XE#7424]) -> [SKIP][26] ([Intel XE#2426] / [Intel XE#5848])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4960-6472756e8384e3945f12b6726dd9dc1ac12f3bb4/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160111v2/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern.html

  
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#5354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#6841]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6841
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7809]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7809


Build changes
-------------

  * Linux: xe-4960-6472756e8384e3945f12b6726dd9dc1ac12f3bb4 -> xe-pw-160111v2

  IGT_8881: aa5853ef5b379b1e4558218c21ef4caeae112184 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4960-6472756e8384e3945f12b6726dd9dc1ac12f3bb4: 6472756e8384e3945f12b6726dd9dc1ac12f3bb4
  xe-pw-160111v2: 160111v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160111v2/index.html

--===============0644382845555112966==
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
<tr><td><b>Series:</b></td><td>drm/xe/rtp: Miscellaneous improvements to rule matching (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/160111/">https://patchwork.freedesktop.org/series/160111/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160111v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160111v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4960-6472756e8384e3945f12b6726dd9dc1ac12f3bb4_FULL -&gt; xe-pw-160111v2_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-160111v2_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-160111v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-160111v2_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_sharpness_filter@filter-formats@pipe-a-edp-1-nv12:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4960-6472756e8384e3945f12b6726dd9dc1ac12f3bb4/shard-lnl-7/igt@kms_sharpness_filter@filter-formats@pipe-a-edp-1-nv12.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160111v2/shard-lnl-2/igt@kms_sharpness_filter@filter-formats@pipe-a-edp-1-nv12.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4960-6472756e8384e3945f12b6726dd9dc1ac12f3bb4/shard-bmg-6/igt@xe_evict@evict-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160111v2/shard-bmg-7/igt@xe_evict@evict-threads-large.html">TIMEOUT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-160111v2_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4960-6472756e8384e3945f12b6726dd9dc1ac12f3bb4/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160111v2/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4960-6472756e8384e3945f12b6726dd9dc1ac12f3bb4/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160111v2/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4960-6472756e8384e3945f12b6726dd9dc1ac12f3bb4/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160111v2/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4960-6472756e8384e3945f12b6726dd9dc1ac12f3bb4/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160111v2/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7809">Intel XE#7809</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4960-6472756e8384e3945f12b6726dd9dc1ac12f3bb4/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160111v2/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_cursor_edge_walk@256x256-top-edge@pipe-d-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4960-6472756e8384e3945f12b6726dd9dc1ac12f3bb4/shard-bmg-2/igt@kms_cursor_edge_walk@256x256-top-edge@pipe-d-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6841">Intel XE#6841</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160111v2/shard-bmg-4/igt@kms_cursor_edge_walk@256x256-top-edge@pipe-d-dp-2.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4960-6472756e8384e3945f12b6726dd9dc1ac12f3bb4/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354">Intel XE#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160111v2/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4960-6472756e8384e3945f12b6726dd9dc1ac12f3bb4/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160111v2/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4960-6472756e8384e3945f12b6726dd9dc1ac12f3bb4/shard-bmg-5/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160111v2/shard-bmg-8/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4960-6472756e8384e3945f12b6726dd9dc1ac12f3bb4/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160111v2/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4960-6472756e8384e3945f12b6726dd9dc1ac12f3bb4/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">Intel XE#7424</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160111v2/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4960-6472756e8384e3945f12b6726dd9dc1ac12f3bb4 -&gt; xe-pw-160111v2</li>
</ul>
<p>IGT_8881: aa5853ef5b379b1e4558218c21ef4caeae112184 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4960-6472756e8384e3945f12b6726dd9dc1ac12f3bb4: 6472756e8384e3945f12b6726dd9dc1ac12f3bb4<br />
  xe-pw-160111v2: 160111v2</p>

</body>
</html>

--===============0644382845555112966==--
