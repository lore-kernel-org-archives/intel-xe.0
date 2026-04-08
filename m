Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4B34EDB7D0
	for <intel-xe@archiver.kernel.org>; Wed,  8 Apr 2026 00:20:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CDCD89CA4;
	Wed,  8 Apr 2026 00:20:11 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45C8089CA4;
 Wed,  8 Apr 2026 00:20:10 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7267822227038689624=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/xe/sysctrl=3A_Add_help?=
 =?utf-8?q?er_to_query_application_status?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 08 Apr 2026 00:20:10 -0000
Message-ID: <177560761026.438154.3941374973360455123@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260407191610.841935-2-anoop.c.vijay@intel.com>
In-Reply-To: <20260407191610.841935-2-anoop.c.vijay@intel.com>
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

--===============7267822227038689624==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/sysctrl: Add helper to query application status
URL   : https://patchwork.freedesktop.org/series/164471/
State : failure

== Summary ==

CI Bug Log - changes from xe-4858-9e217a8df7b2f298a2fd850e29f970b7360dc77b_FULL -> xe-pw-164471v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-164471v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-164471v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-164471v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_plane_alpha_blend@alpha-opaque-fb:
    - shard-bmg:          [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4858-9e217a8df7b2f298a2fd850e29f970b7360dc77b/shard-bmg-7/igt@kms_plane_alpha_blend@alpha-opaque-fb.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164471v1/shard-bmg-6/igt@kms_plane_alpha_blend@alpha-opaque-fb.html

  
Known issues
------------

  Here are the changes found in xe-pw-164471v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][3] -> [DMESG-WARN][4] ([Intel XE#5354])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4858-9e217a8df7b2f298a2fd850e29f970b7360dc77b/shard-bmg-10/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164471v1/shard-bmg-2/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [PASS][5] -> [FAIL][6] ([Intel XE#301])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4858-9e217a8df7b2f298a2fd850e29f970b7360dc77b/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164471v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  
#### Possible fixes ####

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [DMESG-WARN][7] ([Intel XE#5354]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4858-9e217a8df7b2f298a2fd850e29f970b7360dc77b/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164471v1/shard-bmg-3/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [FAIL][9] ([Intel XE#301]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4858-9e217a8df7b2f298a2fd850e29f970b7360dc77b/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164471v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_vrr@flip-dpms:
    - shard-lnl:          [FAIL][11] ([Intel XE#4227] / [Intel XE#7397]) -> [PASS][12] +1 other test pass
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4858-9e217a8df7b2f298a2fd850e29f970b7360dc77b/shard-lnl-8/igt@kms_vrr@flip-dpms.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164471v1/shard-lnl-6/igt@kms_vrr@flip-dpms.html

  
#### Warnings ####

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][13] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][14] ([Intel XE#3544])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4858-9e217a8df7b2f298a2fd850e29f970b7360dc77b/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164471v1/shard-bmg-10/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][15] ([Intel XE#2509] / [Intel XE#7437]) -> [SKIP][16] ([Intel XE#2426] / [Intel XE#5848])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4858-9e217a8df7b2f298a2fd850e29f970b7360dc77b/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164471v1/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#5354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#7397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437


Build changes
-------------

  * Linux: xe-4858-9e217a8df7b2f298a2fd850e29f970b7360dc77b -> xe-pw-164471v1

  IGT_8850: 8850
  xe-4858-9e217a8df7b2f298a2fd850e29f970b7360dc77b: 9e217a8df7b2f298a2fd850e29f970b7360dc77b
  xe-pw-164471v1: 164471v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164471v1/index.html

--===============7267822227038689624==
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
<tr><td><b>Series:</b></td><td>drm/xe/sysctrl: Add helper to query application status</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/164471/">https://patchwork.freedesktop.org/series/164471/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164471v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164471v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4858-9e217a8df7b2f298a2fd850e29f970b7360dc77b_FULL -&gt; xe-pw-164471v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-164471v1_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-164471v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-164471v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_plane_alpha_blend@alpha-opaque-fb:<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4858-9e217a8df7b2f298a2fd850e29f970b7360dc77b/shard-bmg-7/igt@kms_plane_alpha_blend@alpha-opaque-fb.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164471v1/shard-bmg-6/igt@kms_plane_alpha_blend@alpha-opaque-fb.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-164471v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4858-9e217a8df7b2f298a2fd850e29f970b7360dc77b/shard-bmg-10/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164471v1/shard-bmg-2/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354">Intel XE#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4858-9e217a8df7b2f298a2fd850e29f970b7360dc77b/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164471v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4858-9e217a8df7b2f298a2fd850e29f970b7360dc77b/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354">Intel XE#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164471v1/shard-bmg-3/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4858-9e217a8df7b2f298a2fd850e29f970b7360dc77b/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164471v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4858-9e217a8df7b2f298a2fd850e29f970b7360dc77b/shard-lnl-8/igt@kms_vrr@flip-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227">Intel XE#4227</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164471v1/shard-lnl-6/igt@kms_vrr@flip-dpms.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4858-9e217a8df7b2f298a2fd850e29f970b7360dc77b/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164471v1/shard-bmg-10/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4858-9e217a8df7b2f298a2fd850e29f970b7360dc77b/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437">Intel XE#7437</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164471v1/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4858-9e217a8df7b2f298a2fd850e29f970b7360dc77b -&gt; xe-pw-164471v1</li>
</ul>
<p>IGT_8850: 8850<br />
  xe-4858-9e217a8df7b2f298a2fd850e29f970b7360dc77b: 9e217a8df7b2f298a2fd850e29f970b7360dc77b<br />
  xe-pw-164471v1: 164471v1</p>

</body>
</html>

--===============7267822227038689624==--
