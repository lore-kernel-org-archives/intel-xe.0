Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA34CC43327
	for <intel-xe@archiver.kernel.org>; Wed,  1 Jul 2026 06:40:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5669310EDC1;
	Wed,  1 Jul 2026 06:40:32 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B00E10E301;
 Wed,  1 Jul 2026 06:40:31 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5458782758931850416=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_drm/xe=3A_Disable_stolen_m?=
 =?utf-8?q?emory_for_driver_allocations=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 01 Jul 2026 06:40:31 -0000
Message-ID: <178288803155.135316.5296474718017188706@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260630135523.1775379-1-dev@lankhorst.se>
In-Reply-To: <20260630135523.1775379-1-dev@lankhorst.se>
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

--===============5458782758931850416==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Disable stolen memory for driver allocations.
URL   : https://patchwork.freedesktop.org/series/169514/
State : success

== Summary ==

CI Bug Log - changes from xe-5310-949035681a65bc5801212ee164d0ab5ed6ae0d9e_FULL -> xe-pw-169514v1_FULL
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

  Here are the changes found in xe-pw-169514v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotunplug-rescan:
    - shard-bmg:          [PASS][1] -> [ABORT][2] ([Intel XE#8007]) +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5310-949035681a65bc5801212ee164d0ab5ed6ae0d9e/shard-bmg-1/igt@core_hotunplug@hotunplug-rescan.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169514v1/shard-bmg-9/igt@core_hotunplug@hotunplug-rescan.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-dp-2:
    - shard-bmg:          [PASS][3] -> [FAIL][4] ([Intel XE#3718] / [Intel XE#6078]) +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5310-949035681a65bc5801212ee164d0ab5ed6ae0d9e/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-dp-2.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169514v1/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [PASS][5] -> [INCOMPLETE][6] ([Intel XE#7084] / [Intel XE#8150]) +1 other test incomplete
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5310-949035681a65bc5801212ee164d0ab5ed6ae0d9e/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169514v1/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [PASS][7] -> [FAIL][8] ([Intel XE#301])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5310-949035681a65bc5801212ee164d0ab5ed6ae0d9e/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169514v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@xe_intel_bb@blit-reloc:
    - shard-lnl:          [PASS][9] -> [ABORT][10] ([Intel XE#8007])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5310-949035681a65bc5801212ee164d0ab5ed6ae0d9e/shard-lnl-6/igt@xe_intel_bb@blit-reloc.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169514v1/shard-lnl-1/igt@xe_intel_bb@blit-reloc.html

  
#### Possible fixes ####

  * igt@kms_cursor_crc@cursor-sliding-256x256:
    - shard-bmg:          [FAIL][11] ([Intel XE#8117] / [Intel XE#8197]) -> [PASS][12] +1 other test pass
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5310-949035681a65bc5801212ee164d0ab5ed6ae0d9e/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-256x256.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169514v1/shard-bmg-3/igt@kms_cursor_crc@cursor-sliding-256x256.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [FAIL][13] ([Intel XE#5408] / [Intel XE#6266]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5310-949035681a65bc5801212ee164d0ab5ed6ae0d9e/shard-bmg-1/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169514v1/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@2x-plain-flip-fb-recreate@bc-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][15] ([Intel XE#6266]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5310-949035681a65bc5801212ee164d0ab5ed6ae0d9e/shard-bmg-1/igt@kms_flip@2x-plain-flip-fb-recreate@bc-dp2-hdmi-a3.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169514v1/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate@bc-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [FAIL][17] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5310-949035681a65bc5801212ee164d0ab5ed6ae0d9e/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169514v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  
#### Warnings ####

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-lnl:          [FAIL][19] ([Intel XE#301] / [Intel XE#3149]) -> [FAIL][20] ([Intel XE#301])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5310-949035681a65bc5801212ee164d0ab5ed6ae0d9e/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169514v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][21] ([Intel XE#3544]) -> [SKIP][22] ([Intel XE#3374] / [Intel XE#3544])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5310-949035681a65bc5801212ee164d0ab5ed6ae0d9e/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169514v1/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][23] ([Intel XE#2426] / [Intel XE#5848]) -> [FAIL][24] ([Intel XE#1729] / [Intel XE#7424])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5310-949035681a65bc5801212ee164d0ab5ed6ae0d9e/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169514v1/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html

  
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#5408]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5408
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#6266]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8117]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8117
  [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150
  [Intel XE#8197]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8197


Build changes
-------------

  * Linux: xe-5310-949035681a65bc5801212ee164d0ab5ed6ae0d9e -> xe-pw-169514v1

  IGT_8988: 8988
  xe-5310-949035681a65bc5801212ee164d0ab5ed6ae0d9e: 949035681a65bc5801212ee164d0ab5ed6ae0d9e
  xe-pw-169514v1: 169514v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169514v1/index.html

--===============5458782758931850416==
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
<tr><td><b>Series:</b></td><td>drm/xe: Disable stolen memory for driver allocations.</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/169514/">https://patchwork.freedesktop.org/series/169514/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169514v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169514v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5310-949035681a65bc5801212ee164d0ab5ed6ae0d9e_FULL -&gt; xe-pw-169514v1_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-169514v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotunplug-rescan:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5310-949035681a65bc5801212ee164d0ab5ed6ae0d9e/shard-bmg-1/igt@core_hotunplug@hotunplug-rescan.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169514v1/shard-bmg-9/igt@core_hotunplug@hotunplug-rescan.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5310-949035681a65bc5801212ee164d0ab5ed6ae0d9e/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169514v1/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5310-949035681a65bc5801212ee164d0ab5ed6ae0d9e/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169514v1/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE#8150</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5310-949035681a65bc5801212ee164d0ab5ed6ae0d9e/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169514v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@blit-reloc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5310-949035681a65bc5801212ee164d0ab5ed6ae0d9e/shard-lnl-6/igt@xe_intel_bb@blit-reloc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169514v1/shard-lnl-1/igt@xe_intel_bb@blit-reloc.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x256:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5310-949035681a65bc5801212ee164d0ab5ed6ae0d9e/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-256x256.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8117">Intel XE#8117</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8197">Intel XE#8197</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169514v1/shard-bmg-3/igt@kms_cursor_crc@cursor-sliding-256x256.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5310-949035681a65bc5801212ee164d0ab5ed6ae0d9e/shard-bmg-1/igt@kms_flip@2x-plain-flip-fb-recreate.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5408">Intel XE#5408</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266">Intel XE#6266</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169514v1/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5310-949035681a65bc5801212ee164d0ab5ed6ae0d9e/shard-bmg-1/igt@kms_flip@2x-plain-flip-fb-recreate@bc-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266">Intel XE#6266</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169514v1/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate@bc-dp2-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5310-949035681a65bc5801212ee164d0ab5ed6ae0d9e/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169514v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5310-949035681a65bc5801212ee164d0ab5ed6ae0d9e/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169514v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5310-949035681a65bc5801212ee164d0ab5ed6ae0d9e/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169514v1/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5310-949035681a65bc5801212ee164d0ab5ed6ae0d9e/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169514v1/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">Intel XE#7424</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5310-949035681a65bc5801212ee164d0ab5ed6ae0d9e -&gt; xe-pw-169514v1</li>
</ul>
<p>IGT_8988: 8988<br />
  xe-5310-949035681a65bc5801212ee164d0ab5ed6ae0d9e: 949035681a65bc5801212ee164d0ab5ed6ae0d9e<br />
  xe-pw-169514v1: 169514v1</p>

</body>
</html>

--===============5458782758931850416==--
