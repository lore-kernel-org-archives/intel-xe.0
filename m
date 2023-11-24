Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B9E6C61D97
	for <intel-xe@archiver.kernel.org>; Fri, 24 Nov 2023 17:29:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5179C10E20C;
	Fri, 24 Nov 2023 17:29:09 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3BD9F10E20C;
 Fri, 24 Nov 2023 17:29:07 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 35016AADD2;
 Fri, 24 Nov 2023 17:29:07 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============9058701558450732149=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>
Date: Fri, 24 Nov 2023 17:29:07 -0000
Message-ID: <170084694718.13023.13619384917509499068@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231108104953.152671-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20231108104953.152671-1-maarten.lankhorst@linux.intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/i915?=
 =?utf-8?q?=3A_Use_drm=5Fatomic=5Fhelper=5Fwait=5Ffor=5Ffences_helper=2E?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

--===============9058701558450732149==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915: Use drm_atomic_helper_wait_for_fences helper.
URL   : https://patchwork.freedesktop.org/series/126129/
State : success

== Summary ==

CI Bug Log - changes from xe-518-1832821c7e4c5bd24353183f060f1435b2eb7992_BAT -> xe-pw-126129v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-126129v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:
    - bat-adlp-7:         [FAIL][1] ([i915#2346]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-518-1832821c7e4c5bd24353183f060f1435b2eb7992/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126129v1/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html

  * igt@kms_flip@basic-flip-vs-modeset@c-dp3:
    - bat-dg2-oem2:       [FAIL][3] ([Intel XE#557]) -> [PASS][4] +1 other test pass
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-518-1832821c7e4c5bd24353183f060f1435b2eb7992/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-modeset@c-dp3.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126129v1/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-modeset@c-dp3.html

  * igt@kms_flip@basic-flip-vs-modeset@d-dp3:
    - bat-dg2-oem2:       [FAIL][5] ([Intel XE#906]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-518-1832821c7e4c5bd24353183f060f1435b2eb7992/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-modeset@d-dp3.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126129v1/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-modeset@d-dp3.html

  * {igt@xe_create@create-execqueues-noleak}:
    - bat-adlp-7:         [FAIL][7] ([Intel XE#524]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-518-1832821c7e4c5bd24353183f060f1435b2eb7992/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126129v1/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html

  
#### Warnings ####

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - bat-dg2-oem2:       [SKIP][9] ([Intel XE#624]) -> [SKIP][10] ([Intel XE#388])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-518-1832821c7e4c5bd24353183f060f1435b2eb7992/bat-dg2-oem2/igt@kms_addfb_basic@basic-y-tiled-legacy.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126129v1/bat-dg2-oem2/igt@kms_addfb_basic@basic-y-tiled-legacy.html
    - bat-adlp-7:         [FAIL][11] ([Intel XE#609]) -> [SKIP][12] ([Intel XE#388]) +2 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-518-1832821c7e4c5bd24353183f060f1435b2eb7992/bat-adlp-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126129v1/bat-adlp-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_addfb_basic@tile-pitch-mismatch:
    - bat-dg2-oem2:       [FAIL][13] ([Intel XE#609]) -> [SKIP][14] ([Intel XE#388]) +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-518-1832821c7e4c5bd24353183f060f1435b2eb7992/bat-dg2-oem2/igt@kms_addfb_basic@tile-pitch-mismatch.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126129v1/bat-dg2-oem2/igt@kms_addfb_basic@tile-pitch-mismatch.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [FAIL][15] ([Intel XE#616] / [Intel XE#750]) -> [DMESG-FAIL][16] ([Intel XE#282] / [i915#2017])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-518-1832821c7e4c5bd24353183f060f1435b2eb7992/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126129v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
  [Intel XE#388]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/388
  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524
  [Intel XE#557]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/557
  [Intel XE#609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/609
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#624]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/624
  [Intel XE#750]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/750
  [Intel XE#906]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/906
  [i915#2017]: https://gitlab.freedesktop.org/drm/intel/issues/2017
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346


Build changes
-------------

  * IGT: IGT_7600 -> IGT_7603
  * Linux: xe-518-1832821c7e4c5bd24353183f060f1435b2eb7992 -> xe-pw-126129v1

  IGT_7600: b889fd01780dc79f6fcc8545346c81f5c79f5efb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7603: 2ddd8cac90d4333943cd017319514949b047821b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-518-1832821c7e4c5bd24353183f060f1435b2eb7992: 1832821c7e4c5bd24353183f060f1435b2eb7992
  xe-pw-126129v1: 126129v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126129v1/index.html

--===============9058701558450732149==
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
<tr><td><b>Series:</b></td><td>drm/i915: Use drm_atomic_helper_wait_for_fences helper.</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/126129/">https://patchwork.freedesktop.org/series/126129/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126129v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126129v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-518-1832821c7e4c5bd24353183f060f1435b2eb7992_BAT -&gt; xe-pw-126129v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-126129v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-518-1832821c7e4c5bd24353183f060f1435b2eb7992/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126129v1/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@c-dp3:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-518-1832821c7e4c5bd24353183f060f1435b2eb7992/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-modeset@c-dp3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/557">Intel XE#557</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126129v1/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-modeset@c-dp3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@d-dp3:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-518-1832821c7e4c5bd24353183f060f1435b2eb7992/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-modeset@d-dp3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/906">Intel XE#906</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126129v1/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-modeset@d-dp3.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@xe_create@create-execqueues-noleak}:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-518-1832821c7e4c5bd24353183f060f1435b2eb7992/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/524">Intel XE#524</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126129v1/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
<ul>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-518-1832821c7e4c5bd24353183f060f1435b2eb7992/bat-dg2-oem2/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/624">Intel XE#624</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126129v1/bat-dg2-oem2/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/388">Intel XE#388</a>)</p>
</li>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-518-1832821c7e4c5bd24353183f060f1435b2eb7992/bat-adlp-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/609">Intel XE#609</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126129v1/bat-adlp-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/388">Intel XE#388</a>) +2 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@tile-pitch-mismatch:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-518-1832821c7e4c5bd24353183f060f1435b2eb7992/bat-dg2-oem2/igt@kms_addfb_basic@tile-pitch-mismatch.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/609">Intel XE#609</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126129v1/bat-dg2-oem2/igt@kms_addfb_basic@tile-pitch-mismatch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/388">Intel XE#388</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-518-1832821c7e4c5bd24353183f060f1435b2eb7992/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/750">Intel XE#750</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126129v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2017">i915#2017</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7600 -&gt; IGT_7603</li>
<li>Linux: xe-518-1832821c7e4c5bd24353183f060f1435b2eb7992 -&gt; xe-pw-126129v1</li>
</ul>
<p>IGT_7600: b889fd01780dc79f6fcc8545346c81f5c79f5efb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7603: 2ddd8cac90d4333943cd017319514949b047821b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-518-1832821c7e4c5bd24353183f060f1435b2eb7992: 1832821c7e4c5bd24353183f060f1435b2eb7992<br />
  xe-pw-126129v1: 126129v1</p>

</body>
</html>

--===============9058701558450732149==--
