Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A90E4FF8864
	for <intel-xe@archiver.kernel.org>; Fri,  1 May 2026 06:29:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D65110E3F6;
	Fri,  1 May 2026 06:29:35 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11AC410E3F6;
 Fri,  1 May 2026 06:29:34 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8796663945795551672=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_drm/i915=3A_Introduce_=27f?=
 =?utf-8?q?b=5Fpin=27_parent_interface_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 01 May 2026 06:29:34 -0000
Message-ID: <177761697406.31407.18216248779700621354@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260423165346.20884-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20260423165346.20884-1-ville.syrjala@linux.intel.com>
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

--===============8796663945795551672==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915: Introduce 'fb_pin' parent interface (rev2)
URL   : https://patchwork.freedesktop.org/series/165375/
State : success

== Summary ==

CI Bug Log - changes from xe-4960-6472756e8384e3945f12b6726dd9dc1ac12f3bb4_FULL -> xe-pw-165375v2_FULL
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

  Here are the changes found in xe-pw-165375v2_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [PASS][1] -> [FAIL][2] ([Intel XE#7809])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4960-6472756e8384e3945f12b6726dd9dc1ac12f3bb4/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165375v2/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  
#### Possible fixes ####

  * igt@kms_cursor_edge_walk@256x256-top-edge@pipe-d-dp-2:
    - shard-bmg:          [FAIL][3] ([Intel XE#6841]) -> [PASS][4] +1 other test pass
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4960-6472756e8384e3945f12b6726dd9dc1ac12f3bb4/shard-bmg-2/igt@kms_cursor_edge_walk@256x256-top-edge@pipe-d-dp-2.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165375v2/shard-bmg-2/igt@kms_cursor_edge_walk@256x256-top-edge@pipe-d-dp-2.html

  * igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [DMESG-WARN][5] ([Intel XE#5354]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4960-6472756e8384e3945f12b6726dd9dc1ac12f3bb4/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165375v2/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [FAIL][7] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][8] +1 other test pass
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4960-6472756e8384e3945f12b6726dd9dc1ac12f3bb4/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165375v2/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][9] ([Intel XE#1503]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4960-6472756e8384e3945f12b6726dd9dc1ac12f3bb4/shard-bmg-5/igt@kms_hdr@invalid-hdr.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165375v2/shard-bmg-1/igt@kms_hdr@invalid-hdr.html

  
#### Warnings ####

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][11] ([Intel XE#3544]) -> [SKIP][12] ([Intel XE#3374] / [Intel XE#3544])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4960-6472756e8384e3945f12b6726dd9dc1ac12f3bb4/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165375v2/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][13] ([Intel XE#1729] / [Intel XE#7424]) -> [SKIP][14] ([Intel XE#2426] / [Intel XE#5848])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4960-6472756e8384e3945f12b6726dd9dc1ac12f3bb4/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165375v2/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html

  
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#5354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#6841]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6841
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7809]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7809


Build changes
-------------

  * Linux: xe-4960-6472756e8384e3945f12b6726dd9dc1ac12f3bb4 -> xe-pw-165375v2

  IGT_8881: aa5853ef5b379b1e4558218c21ef4caeae112184 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4960-6472756e8384e3945f12b6726dd9dc1ac12f3bb4: 6472756e8384e3945f12b6726dd9dc1ac12f3bb4
  xe-pw-165375v2: 165375v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165375v2/index.html

--===============8796663945795551672==
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
<tr><td><b>Series:</b></td><td>drm/i915: Introduce &#x27;fb_pin&#x27; parent interface (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/165375/">https://patchwork.freedesktop.org/series/165375/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165375v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165375v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4960-6472756e8384e3945f12b6726dd9dc1ac12f3bb4_FULL -&gt; xe-pw-165375v2_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-165375v2_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_cursor_legacy@flip-vs-cursor-atomic:<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4960-6472756e8384e3945f12b6726dd9dc1ac12f3bb4/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165375v2/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7809">Intel XE#7809</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_cursor_edge_walk@256x256-top-edge@pipe-d-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4960-6472756e8384e3945f12b6726dd9dc1ac12f3bb4/shard-bmg-2/igt@kms_cursor_edge_walk@256x256-top-edge@pipe-d-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6841">Intel XE#6841</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165375v2/shard-bmg-2/igt@kms_cursor_edge_walk@256x256-top-edge@pipe-d-dp-2.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4960-6472756e8384e3945f12b6726dd9dc1ac12f3bb4/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354">Intel XE#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165375v2/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4960-6472756e8384e3945f12b6726dd9dc1ac12f3bb4/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165375v2/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4960-6472756e8384e3945f12b6726dd9dc1ac12f3bb4/shard-bmg-5/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165375v2/shard-bmg-1/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4960-6472756e8384e3945f12b6726dd9dc1ac12f3bb4/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165375v2/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4960-6472756e8384e3945f12b6726dd9dc1ac12f3bb4/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">Intel XE#7424</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165375v2/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4960-6472756e8384e3945f12b6726dd9dc1ac12f3bb4 -&gt; xe-pw-165375v2</li>
</ul>
<p>IGT_8881: aa5853ef5b379b1e4558218c21ef4caeae112184 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4960-6472756e8384e3945f12b6726dd9dc1ac12f3bb4: 6472756e8384e3945f12b6726dd9dc1ac12f3bb4<br />
  xe-pw-165375v2: 165375v2</p>

</body>
</html>

--===============8796663945795551672==--
