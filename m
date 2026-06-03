Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28DEECD6E4A
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jun 2026 05:48:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB91910F87A;
	Wed,  3 Jun 2026 05:48:03 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 982D010F879;
 Wed,  3 Jun 2026 05:48:02 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2956089959309762555=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_drm/i915/dp=3A_Handle_VSC_?=
 =?utf-8?q?SDP_revision_7_in_unpack?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Juasheem Sultan" <jdsultan@google.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 03 Jun 2026 05:48:02 -0000
Message-ID: <178046568261.38280.11299809858384637989@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260430231206.772649-1-jdsultan@google.com>
In-Reply-To: <20260430231206.772649-1-jdsultan@google.com>
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

--===============2956089959309762555==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/dp: Handle VSC SDP revision 7 in unpack
URL   : https://patchwork.freedesktop.org/series/167774/
State : success

== Summary ==

CI Bug Log - changes from xe-5182-371c7e87ff59401f6127f7fb67e3caff10786653_FULL -> xe-pw-167774v1_FULL
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

  Here are the changes found in xe-pw-167774v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [PASS][1] -> [FAIL][2] ([Intel XE#7571])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5182-371c7e87ff59401f6127f7fb67e3caff10786653/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167774v1/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [PASS][3] -> [FAIL][4] ([Intel XE#301]) +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5182-371c7e87ff59401f6127f7fb67e3caff10786653/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167774v1/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010:
    - shard-bmg:          [PASS][5] -> [SKIP][6] ([Intel XE#7915]) +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5182-371c7e87ff59401f6127f7fb67e3caff10786653/shard-bmg-4/igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167774v1/shard-bmg-7/igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-lnl:          [PASS][7] -> [FAIL][8] ([Intel XE#2029] / [Intel XE#7395])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5182-371c7e87ff59401f6127f7fb67e3caff10786653/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167774v1/shard-lnl-4/igt@kms_pm_dc@deep-pkgc.html

  * igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads:
    - shard-bmg:          [PASS][9] -> [FAIL][10] ([Intel XE#7850])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5182-371c7e87ff59401f6127f7fb67e3caff10786653/shard-bmg-8/igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167774v1/shard-bmg-3/igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads.html

  
#### Possible fixes ####

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][11] ([Intel XE#6321]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5182-371c7e87ff59401f6127f7fb67e3caff10786653/shard-bmg-8/igt@xe_evict@evict-mixed-many-threads-small.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167774v1/shard-bmg-3/igt@xe_evict@evict-mixed-many-threads-small.html

  
#### Warnings ####

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][13] ([Intel XE#2509] / [Intel XE#7437]) -> [SKIP][14] ([Intel XE#2426] / [Intel XE#5848])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5182-371c7e87ff59401f6127f7fb67e3caff10786653/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167774v1/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  
  [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#7395]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7395
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571
  [Intel XE#7850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7850
  [Intel XE#7915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915


Build changes
-------------

  * Linux: xe-5182-371c7e87ff59401f6127f7fb67e3caff10786653 -> xe-pw-167774v1

  IGT_8946: 8946
  xe-5182-371c7e87ff59401f6127f7fb67e3caff10786653: 371c7e87ff59401f6127f7fb67e3caff10786653
  xe-pw-167774v1: 167774v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167774v1/index.html

--===============2956089959309762555==
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
<tr><td><b>Series:</b></td><td>drm/i915/dp: Handle VSC SDP revision 7 in unpack</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/167774/">https://patchwork.freedesktop.org/series/167774/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167774v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167774v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5182-371c7e87ff59401f6127f7fb67e3caff10786653_FULL -&gt; xe-pw-167774v1_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-167774v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5182-371c7e87ff59401f6127f7fb67e3caff10786653/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167774v1/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571">Intel XE#7571</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5182-371c7e87ff59401f6127f7fb67e3caff10786653/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167774v1/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5182-371c7e87ff59401f6127f7fb67e3caff10786653/shard-bmg-4/igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167774v1/shard-bmg-7/igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5182-371c7e87ff59401f6127f7fb67e3caff10786653/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167774v1/shard-lnl-4/igt@kms_pm_dc@deep-pkgc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029">Intel XE#2029</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7395">Intel XE#7395</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5182-371c7e87ff59401f6127f7fb67e3caff10786653/shard-bmg-8/igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167774v1/shard-bmg-3/igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7850">Intel XE#7850</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_evict@evict-mixed-many-threads-small:<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5182-371c7e87ff59401f6127f7fb67e3caff10786653/shard-bmg-8/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167774v1/shard-bmg-3/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_tiled_display@basic-test-pattern-with-chamelium:<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5182-371c7e87ff59401f6127f7fb67e3caff10786653/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437">Intel XE#7437</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167774v1/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5182-371c7e87ff59401f6127f7fb67e3caff10786653 -&gt; xe-pw-167774v1</li>
</ul>
<p>IGT_8946: 8946<br />
  xe-5182-371c7e87ff59401f6127f7fb67e3caff10786653: 371c7e87ff59401f6127f7fb67e3caff10786653<br />
  xe-pw-167774v1: 167774v1</p>

</body>
</html>

--===============2956089959309762555==--
