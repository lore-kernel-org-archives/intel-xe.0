Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DB55FB44A2
	for <intel-xe@archiver.kernel.org>; Fri, 24 Apr 2026 04:53:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA03210E0EB;
	Fri, 24 Apr 2026 04:53:24 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 215AB10E054;
 Fri, 24 Apr 2026 04:53:24 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3691548350534538780=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_i915=3A_use_display_instea?=
 =?utf-8?q?d_of_dereferencing_dmc_in_intel=5Fdmc=5Fupdate=5Fdc6=5Fallowed=5F?=
 =?utf-8?q?count?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Desnes Nunes" <desnesn@redhat.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 24 Apr 2026 04:53:24 -0000
Message-ID: <177700640412.4863.12252222435640950220@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260423201020.506908-1-desnesn@redhat.com>
In-Reply-To: <20260423201020.506908-1-desnesn@redhat.com>
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

--===============3691548350534538780==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: i915: use display instead of dereferencing dmc in intel_dmc_update_dc6_allowed_count
URL   : https://patchwork.freedesktop.org/series/165387/
State : failure

== Summary ==

CI Bug Log - changes from xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4_FULL -> xe-pw-165387v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-165387v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-165387v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-165387v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-bmg:          [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-4.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165387v1/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-4.html

  
Known issues
------------

  Here are the changes found in xe-pw-165387v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_plane_multiple@2x-tiling-4@pipe-d-dp-2-pipe-a-hdmi-a-3:
    - shard-bmg:          [PASS][3] -> [ABORT][4] ([Intel XE#5545] / [Intel XE#6652])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-4@pipe-d-dp-2-pipe-a-hdmi-a-3.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165387v1/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-4@pipe-d-dp-2-pipe-a-hdmi-a-3.html

  * igt@xe_configfs@gt-types-allowed:
    - shard-bmg:          [PASS][5] -> [DMESG-WARN][6] ([Intel XE#7725])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-8/igt@xe_configfs@gt-types-allowed.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165387v1/shard-bmg-6/igt@xe_configfs@gt-types-allowed.html

  
#### Possible fixes ####

  * igt@kms_flip@blocking-wf_vblank@b-dp2:
    - shard-bmg:          [FAIL][7] ([Intel XE#7705]) -> [PASS][8] +1 other test pass
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-3/igt@kms_flip@blocking-wf_vblank@b-dp2.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165387v1/shard-bmg-10/igt@kms_flip@blocking-wf_vblank@b-dp2.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-lnl:          [FAIL][9] ([Intel XE#6361]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-lnl-7/igt@kms_setmode@basic@pipe-b-edp-1.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165387v1/shard-lnl-8/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@xe_survivability@runtime-survivability:
    - shard-bmg:          [DMESG-WARN][11] ([Intel XE#6627] / [Intel XE#7419]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-10/igt@xe_survivability@runtime-survivability.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165387v1/shard-bmg-5/igt@xe_survivability@runtime-survivability.html

  
#### Warnings ####

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][13] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][14] ([Intel XE#3544])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-3/igt@kms_hdr@brightness-with-hdr.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165387v1/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html

  
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#6361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361
  [Intel XE#6627]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6627
  [Intel XE#6652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652
  [Intel XE#7419]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7419
  [Intel XE#7705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7705
  [Intel XE#7725]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7725


Build changes
-------------

  * Linux: xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4 -> xe-pw-165387v1

  IGT_8872: e70db143b7bafe09bdea4d33188cb10d2070d0e5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4: 021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4
  xe-pw-165387v1: 165387v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165387v1/index.html

--===============3691548350534538780==
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
<tr><td><b>Series:</b></td><td>i915: use display instead of dereferencing dmc in intel_dmc_update_dc6_allowed_count</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/165387/">https://patchwork.freedesktop.org/series/165387/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165387v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165387v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4_FULL -&gt; xe-pw-165387v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-165387v1_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-165387v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-165387v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_plane_multiple@2x-tiling-4:<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165387v1/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-4.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-165387v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4@pipe-d-dp-2-pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-4@pipe-d-dp-2-pipe-a-hdmi-a-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165387v1/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-4@pipe-d-dp-2-pipe-a-hdmi-a-3.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652">Intel XE#6652</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_configfs@gt-types-allowed:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-8/igt@xe_configfs@gt-types-allowed.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165387v1/shard-bmg-6/igt@xe_configfs@gt-types-allowed.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7725">Intel XE#7725</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@blocking-wf_vblank@b-dp2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-3/igt@kms_flip@blocking-wf_vblank@b-dp2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7705">Intel XE#7705</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165387v1/shard-bmg-10/igt@kms_flip@blocking-wf_vblank@b-dp2.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-lnl-7/igt@kms_setmode@basic@pipe-b-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361">Intel XE#6361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165387v1/shard-lnl-8/igt@kms_setmode@basic@pipe-b-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_survivability@runtime-survivability:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-10/igt@xe_survivability@runtime-survivability.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6627">Intel XE#6627</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7419">Intel XE#7419</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165387v1/shard-bmg-5/igt@xe_survivability@runtime-survivability.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_hdr@brightness-with-hdr:<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-3/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165387v1/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4 -&gt; xe-pw-165387v1</li>
</ul>
<p>IGT_8872: e70db143b7bafe09bdea4d33188cb10d2070d0e5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4: 021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4<br />
  xe-pw-165387v1: 165387v1</p>

</body>
</html>

--===============3691548350534538780==--
