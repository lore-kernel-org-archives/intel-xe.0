Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAA70CD98E4
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jun 2026 22:34:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62F6C10E4B9;
	Wed, 17 Jun 2026 22:34:20 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 013F210E420;
 Wed, 17 Jun 2026 22:34:20 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1723568631475485427=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_drm/xe=3A_Improve_wedged_s?=
 =?utf-8?q?tate_management?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 17 Jun 2026 22:34:19 -0000
Message-ID: <178173565999.91568.12113225861409624474@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260617120542.96444-1-raag.jadav@intel.com>
In-Reply-To: <20260617120542.96444-1-raag.jadav@intel.com>
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

--===============1723568631475485427==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Improve wedged state management
URL   : https://patchwork.freedesktop.org/series/168706/
State : success

== Summary ==

CI Bug Log - changes from xe-5272-2c78b42ee6ffe01d609bdf18ece05a5627d0bb25_FULL -> xe-pw-168706v1_FULL
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

  Here are the changes found in xe-pw-168706v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-hdmi-a-3:
    - shard-bmg:          [PASS][1] -> [INCOMPLETE][2] ([Intel XE#7084] / [Intel XE#8150])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5272-2c78b42ee6ffe01d609bdf18ece05a5627d0bb25/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-hdmi-a-3.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168706v1/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-hdmi-a-3.html

  * igt@kms_flip@2x-blocking-wf_vblank@ac-dp2-hdmi-a3:
    - shard-bmg:          [PASS][3] -> [FAIL][4] ([Intel XE#6266]) +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5272-2c78b42ee6ffe01d609bdf18ece05a5627d0bb25/shard-bmg-9/igt@kms_flip@2x-blocking-wf_vblank@ac-dp2-hdmi-a3.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168706v1/shard-bmg-2/igt@kms_flip@2x-blocking-wf_vblank@ac-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [PASS][5] -> [FAIL][6] ([Intel XE#301])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5272-2c78b42ee6ffe01d609bdf18ece05a5627d0bb25/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168706v1/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [PASS][7] -> [INCOMPLETE][8] ([Intel XE#6321] / [Intel XE#8355])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5272-2c78b42ee6ffe01d609bdf18ece05a5627d0bb25/shard-bmg-6/igt@xe_evict@evict-mixed-many-threads-small.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168706v1/shard-bmg-6/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-bmg:          [PASS][9] -> [ABORT][10] ([Intel XE#8007])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5272-2c78b42ee6ffe01d609bdf18ece05a5627d0bb25/shard-bmg-7/igt@xe_wedged@wedged-mode-toggle.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168706v1/shard-bmg-10/igt@xe_wedged@wedged-mode-toggle.html

  
#### Possible fixes ####

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [FAIL][11] ([Intel XE#301]) -> [PASS][12] +1 other test pass
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5272-2c78b42ee6ffe01d609bdf18ece05a5627d0bb25/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168706v1/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][13] ([Intel XE#1503]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5272-2c78b42ee6ffe01d609bdf18ece05a5627d0bb25/shard-bmg-10/igt@kms_hdr@invalid-hdr.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168706v1/shard-bmg-8/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010:
    - shard-bmg:          [SKIP][15] ([Intel XE#7922]) -> [PASS][16] +1 other test pass
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5272-2c78b42ee6ffe01d609bdf18ece05a5627d0bb25/shard-bmg-10/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168706v1/shard-bmg-8/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010.html

  * igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-3-xrgb16161616f:
    - shard-bmg:          [SKIP][17] ([Intel XE#7915]) -> [PASS][18] +1 other test pass
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5272-2c78b42ee6ffe01d609bdf18ece05a5627d0bb25/shard-bmg-2/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-3-xrgb16161616f.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168706v1/shard-bmg-5/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-3-xrgb16161616f.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-lnl:          [FAIL][19] ([Intel XE#6361]) -> [PASS][20] +2 other tests pass
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5272-2c78b42ee6ffe01d609bdf18ece05a5627d0bb25/shard-lnl-8/igt@kms_setmode@basic@pipe-b-edp-1.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168706v1/shard-lnl-1/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][21] ([Intel XE#6321] / [Intel XE#8355]) -> [PASS][22]
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5272-2c78b42ee6ffe01d609bdf18ece05a5627d0bb25/shard-bmg-7/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168706v1/shard-bmg-2/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  
#### Warnings ####

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-lnl:          [SKIP][23] ([Intel XE#656] / [Intel XE#7905]) -> [ABORT][24] ([Intel XE#8007])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5272-2c78b42ee6ffe01d609bdf18ece05a5627d0bb25/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168706v1/shard-lnl-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][25] ([Intel XE#1729] / [Intel XE#7424]) -> [SKIP][26] ([Intel XE#2426] / [Intel XE#5848])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5272-2c78b42ee6ffe01d609bdf18ece05a5627d0bb25/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168706v1/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html

  
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#6266]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#7915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915
  [Intel XE#7922]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7922
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150
  [Intel XE#8355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355


Build changes
-------------

  * Linux: xe-5272-2c78b42ee6ffe01d609bdf18ece05a5627d0bb25 -> xe-pw-168706v1

  IGT_8969: 5a8fa64e48c3c30af9afa2824d6adb5ad2bcc5a3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5272-2c78b42ee6ffe01d609bdf18ece05a5627d0bb25: 2c78b42ee6ffe01d609bdf18ece05a5627d0bb25
  xe-pw-168706v1: 168706v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168706v1/index.html

--===============1723568631475485427==
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
<tr><td><b>Series:</b></td><td>drm/xe: Improve wedged state management</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/168706/">https://patchwork.freedesktop.org/series/168706/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168706v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168706v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5272-2c78b42ee6ffe01d609bdf18ece05a5627d0bb25_FULL -&gt; xe-pw-168706v1_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-168706v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5272-2c78b42ee6ffe01d609bdf18ece05a5627d0bb25/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-hdmi-a-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168706v1/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-hdmi-a-3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE#8150</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5272-2c78b42ee6ffe01d609bdf18ece05a5627d0bb25/shard-bmg-9/igt@kms_flip@2x-blocking-wf_vblank@ac-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168706v1/shard-bmg-2/igt@kms_flip@2x-blocking-wf_vblank@ac-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266">Intel XE#6266</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5272-2c78b42ee6ffe01d609bdf18ece05a5627d0bb25/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168706v1/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5272-2c78b42ee6ffe01d609bdf18ece05a5627d0bb25/shard-bmg-6/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168706v1/shard-bmg-6/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355">Intel XE#8355</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5272-2c78b42ee6ffe01d609bdf18ece05a5627d0bb25/shard-bmg-7/igt@xe_wedged@wedged-mode-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168706v1/shard-bmg-10/igt@xe_wedged@wedged-mode-toggle.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5272-2c78b42ee6ffe01d609bdf18ece05a5627d0bb25/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168706v1/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5272-2c78b42ee6ffe01d609bdf18ece05a5627d0bb25/shard-bmg-10/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168706v1/shard-bmg-8/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5272-2c78b42ee6ffe01d609bdf18ece05a5627d0bb25/shard-bmg-10/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7922">Intel XE#7922</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168706v1/shard-bmg-8/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-3-xrgb16161616f:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5272-2c78b42ee6ffe01d609bdf18ece05a5627d0bb25/shard-bmg-2/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-3-xrgb16161616f.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168706v1/shard-bmg-5/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-3-xrgb16161616f.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5272-2c78b42ee6ffe01d609bdf18ece05a5627d0bb25/shard-lnl-8/igt@kms_setmode@basic@pipe-b-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361">Intel XE#6361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168706v1/shard-lnl-1/igt@kms_setmode@basic@pipe-b-edp-1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5272-2c78b42ee6ffe01d609bdf18ece05a5627d0bb25/shard-bmg-7/igt@xe_evict@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355">Intel XE#8355</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168706v1/shard-bmg-2/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5272-2c78b42ee6ffe01d609bdf18ece05a5627d0bb25/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168706v1/shard-lnl-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5272-2c78b42ee6ffe01d609bdf18ece05a5627d0bb25/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">Intel XE#7424</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168706v1/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5272-2c78b42ee6ffe01d609bdf18ece05a5627d0bb25 -&gt; xe-pw-168706v1</li>
</ul>
<p>IGT_8969: 5a8fa64e48c3c30af9afa2824d6adb5ad2bcc5a3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5272-2c78b42ee6ffe01d609bdf18ece05a5627d0bb25: 2c78b42ee6ffe01d609bdf18ece05a5627d0bb25<br />
  xe-pw-168706v1: 168706v1</p>

</body>
</html>

--===============1723568631475485427==--
