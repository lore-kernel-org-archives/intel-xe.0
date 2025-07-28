Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96EEDC83F17
	for <intel-xe@archiver.kernel.org>; Mon, 28 Jul 2025 19:33:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C5DB10E115;
	Mon, 28 Jul 2025 19:33:50 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA4A510E008;
 Mon, 28 Jul 2025 19:33:49 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7401778809502828248=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_Tile_and_GT_counting_improv?=
 =?utf-8?q?ements_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 28 Jul 2025 19:33:49 -0000
Message-ID: <175373122968.194773.10460939728994079624@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250728-gt_count-improvements-v2-0-78841ce8a81c@intel.com>
In-Reply-To: <20250728-gt_count-improvements-v2-0-78841ce8a81c@intel.com>
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

--===============7401778809502828248==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Tile and GT counting improvements (rev2)
URL   : https://patchwork.freedesktop.org/series/152026/
State : failure

== Summary ==

CI Bug Log - changes from xe-3480-51feeecc1f4cd7066d2ba2cd35f5c1ff39af6a09_BAT -> xe-pw-152026v2_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-152026v2_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-152026v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): bat-adlp-vm 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-152026v2_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@sriov_basic@enable-vfs-autoprobe-on:
    - bat-adlp-7:         [PASS][1] -> [ABORT][2] +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3480-51feeecc1f4cd7066d2ba2cd35f5c1ff39af6a09/bat-adlp-7/igt@sriov_basic@enable-vfs-autoprobe-on.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v2/bat-adlp-7/igt@sriov_basic@enable-vfs-autoprobe-on.html

  * igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1:
    - bat-atsm-2:         [PASS][3] -> [ABORT][4] +1 other test abort
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3480-51feeecc1f4cd7066d2ba2cd35f5c1ff39af6a09/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v2/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html

  
Known issues
------------

  Here are the changes found in xe-pw-152026v2_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_pat@pat-index-xe2@render:
    - bat-bmg-1:          [FAIL][5] ([Intel XE#5507]) -> [PASS][6] +1 other test pass
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3480-51feeecc1f4cd7066d2ba2cd35f5c1ff39af6a09/bat-bmg-1/igt@xe_pat@pat-index-xe2@render.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v2/bat-bmg-1/igt@xe_pat@pat-index-xe2@render.html

  
  [Intel XE#5507]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5507


Build changes
-------------

  * IGT: IGT_8476 -> IGT_8477
  * Linux: xe-3480-51feeecc1f4cd7066d2ba2cd35f5c1ff39af6a09 -> xe-pw-152026v2

  IGT_8476: 232d4de46aa5ec03aee240657c0b36110f8a6246 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8477: 3e5ec9d06ce17d6e135901bda13957dc31ae4bf4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3480-51feeecc1f4cd7066d2ba2cd35f5c1ff39af6a09: 51feeecc1f4cd7066d2ba2cd35f5c1ff39af6a09
  xe-pw-152026v2: 152026v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v2/index.html

--===============7401778809502828248==
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
<tr><td><b>Series:</b></td><td>Tile and GT counting improvements (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/152026/">https://patchwork.freedesktop.org/series/152026/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3480-51feeecc1f4cd7066d2ba2cd35f5c1ff39af6a09_BAT -&gt; xe-pw-152026v2_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-152026v2_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-152026v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-152026v2_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3480-51feeecc1f4cd7066d2ba2cd35f5c1ff39af6a09/bat-adlp-7/igt@sriov_basic@enable-vfs-autoprobe-on.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v2/bat-adlp-7/igt@sriov_basic@enable-vfs-autoprobe-on.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3480-51feeecc1f4cd7066d2ba2cd35f5c1ff39af6a09/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v2/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-152026v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_pat@pat-index-xe2@render:<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3480-51feeecc1f4cd7066d2ba2cd35f5c1ff39af6a09/bat-bmg-1/igt@xe_pat@pat-index-xe2@render.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5507">Intel XE#5507</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152026v2/bat-bmg-1/igt@xe_pat@pat-index-xe2@render.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8476 -&gt; IGT_8477</li>
<li>Linux: xe-3480-51feeecc1f4cd7066d2ba2cd35f5c1ff39af6a09 -&gt; xe-pw-152026v2</li>
</ul>
<p>IGT_8476: 232d4de46aa5ec03aee240657c0b36110f8a6246 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8477: 3e5ec9d06ce17d6e135901bda13957dc31ae4bf4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3480-51feeecc1f4cd7066d2ba2cd35f5c1ff39af6a09: 51feeecc1f4cd7066d2ba2cd35f5c1ff39af6a09<br />
  xe-pw-152026v2: 152026v2</p>

</body>
</html>

--===============7401778809502828248==--
