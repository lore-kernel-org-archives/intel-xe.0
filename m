Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90152C27C4F
	for <intel-xe@archiver.kernel.org>; Sat, 15 Jun 2024 10:13:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8FD510E09F;
	Sat, 15 Jun 2024 10:13:27 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0279510E2F8;
 Sat, 15 Jun 2024 10:13:26 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5914366432658464883=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe=3A_Fix_missing_runtime_o?=
 =?utf-8?q?uter_protection_for_ggtt=5Fremove=5Fnode_=28rev8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 15 Jun 2024 10:13:26 -0000
Message-ID: <171844640600.95803.14555659642165022493@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240614214202.18430-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240614214202.18430-1-rodrigo.vivi@intel.com>
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

--===============5914366432658464883==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Fix missing runtime outer protection for ggtt_remove_node (rev8)
URL   : https://patchwork.freedesktop.org/series/134308/
State : failure

== Summary ==

CI Bug Log - changes from xe-1473-f092ea99230dda54d66611f0c6facaacea827ae8_full -> xe-pw-134308v8_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-134308v8_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-134308v8_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 1)
------------------------------

  ERROR: It appears as if the changes made in xe-pw-134308v8_full prevented too many machines from booting.

  Missing    (2): shard-dg2-set2 shard-lnl 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-134308v8_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-mode:
    - shard-adlp:         [PASS][1] -> [FAIL][2] +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1473-f092ea99230dda54d66611f0c6facaacea827ae8/shard-adlp-8/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-mode.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v8/shard-adlp-4/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-mode.html

  * igt@xe_vm@munmap-style-unbind-userptr-inval-many-all:
    - shard-adlp:         [PASS][3] -> [ABORT][4] +33 other tests abort
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1473-f092ea99230dda54d66611f0c6facaacea827ae8/shard-adlp-4/igt@xe_vm@munmap-style-unbind-userptr-inval-many-all.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v8/shard-adlp-8/igt@xe_vm@munmap-style-unbind-userptr-inval-many-all.html

  
#### Warnings ####

  * igt@kms_content_protection@mei-interface:
    - shard-adlp:         [SKIP][5] ([Intel XE#1201] / [Intel XE#455]) -> [ABORT][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1473-f092ea99230dda54d66611f0c6facaacea827ae8/shard-adlp-6/igt@kms_content_protection@mei-interface.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v8/shard-adlp-1/igt@kms_content_protection@mei-interface.html

  
Known issues
------------

  Here are the changes found in xe-pw-134308v8_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-plain-flip:
    - shard-adlp:         [PASS][7] -> [INCOMPLETE][8] ([Intel XE#1150] / [Intel XE#1195])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1473-f092ea99230dda54d66611f0c6facaacea827ae8/shard-adlp-2/igt@kms_flip@basic-plain-flip.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v8/shard-adlp-9/igt@kms_flip@basic-plain-flip.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-b-hdmi-a-1:
    - shard-adlp:         [PASS][9] -> [INCOMPLETE][10] ([Intel XE#1195]) +2 other tests incomplete
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1473-f092ea99230dda54d66611f0c6facaacea827ae8/shard-adlp-2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-b-hdmi-a-1.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v8/shard-adlp-2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-b-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers:
    - shard-adlp:         [PASS][11] -> [ABORT][12] ([Intel XE#1205]) +2 other tests abort
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1473-f092ea99230dda54d66611f0c6facaacea827ae8/shard-adlp-1/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v8/shard-adlp-2/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers.html

  * igt@kms_vblank@ts-continuation-modeset-hang@pipe-a-hdmi-a-1:
    - shard-adlp:         [PASS][13] -> [ABORT][14] ([Intel XE#1034]) +1 other test abort
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1473-f092ea99230dda54d66611f0c6facaacea827ae8/shard-adlp-4/igt@kms_vblank@ts-continuation-modeset-hang@pipe-a-hdmi-a-1.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v8/shard-adlp-9/igt@kms_vblank@ts-continuation-modeset-hang@pipe-a-hdmi-a-1.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-adlp:         [PASS][15] -> [FAIL][16] ([Intel XE#958])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1473-f092ea99230dda54d66611f0c6facaacea827ae8/shard-adlp-4/igt@xe_pm_residency@toggle-gt-c6.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v8/shard-adlp-6/igt@xe_pm_residency@toggle-gt-c6.html

  
#### Warnings ####

  * igt@kms_content_protection@uevent:
    - shard-adlp:         [SKIP][17] ([Intel XE#1201] / [Intel XE#455]) -> [INCOMPLETE][18] ([Intel XE#1195] / [Intel XE#1507])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1473-f092ea99230dda54d66611f0c6facaacea827ae8/shard-adlp-1/igt@kms_content_protection@uevent.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v8/shard-adlp-4/igt@kms_content_protection@uevent.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-adlp:         [ABORT][19] ([Intel XE#1034] / [Intel XE#1191]) -> [INCOMPLETE][20] ([Intel XE#1034] / [Intel XE#1195])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1473-f092ea99230dda54d66611f0c6facaacea827ae8/shard-adlp-2/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v8/shard-adlp-6/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][21] ([Intel XE#1191] / [Intel XE#1214]) -> [INCOMPLETE][22] ([Intel XE#1034] / [Intel XE#1195])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1473-f092ea99230dda54d66611f0c6facaacea827ae8/shard-adlp-2/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v8/shard-adlp-6/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html

  
  [Intel XE#1034]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034
  [Intel XE#1150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1150
  [Intel XE#1191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1205]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1205
  [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
  [Intel XE#1507]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1507
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958


Build changes
-------------

  * Linux: xe-1473-f092ea99230dda54d66611f0c6facaacea827ae8 -> xe-pw-134308v8

  IGT_7889: 9dca15da37f2a385b04427eb39cd460224d09c25 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1473-f092ea99230dda54d66611f0c6facaacea827ae8: f092ea99230dda54d66611f0c6facaacea827ae8
  xe-pw-134308v8: 134308v8

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v8/index.html

--===============5914366432658464883==
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
<tr><td><b>Series:</b></td><td>drm/xe: Fix missing runtime outer protection for ggtt_remove_node (rev8)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/134308/">https://patchwork.freedesktop.org/series/134308/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v8/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v8/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1473-f092ea99230dda54d66611f0c6facaacea827ae8_full -&gt; xe-pw-134308v8_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-134308v8_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-134308v8_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (3 -&gt; 1)</h2>
<p>ERROR: It appears as if the changes made in xe-pw-134308v8_full prevented too many machines from booting.</p>
<p>Missing    (2): shard-dg2-set2 shard-lnl </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-134308v8_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1473-f092ea99230dda54d66611f0c6facaacea827ae8/shard-adlp-8/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-mode.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v8/shard-adlp-4/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-mode.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-userptr-inval-many-all:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1473-f092ea99230dda54d66611f0c6facaacea827ae8/shard-adlp-4/igt@xe_vm@munmap-style-unbind-userptr-inval-many-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v8/shard-adlp-8/igt@xe_vm@munmap-style-unbind-userptr-inval-many-all.html">ABORT</a> +33 other tests abort</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_content_protection@mei-interface:<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1473-f092ea99230dda54d66611f0c6facaacea827ae8/shard-adlp-6/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v8/shard-adlp-1/igt@kms_content_protection@mei-interface.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-134308v8_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_flip@basic-plain-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1473-f092ea99230dda54d66611f0c6facaacea827ae8/shard-adlp-2/igt@kms_flip@basic-plain-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v8/shard-adlp-9/igt@kms_flip@basic-plain-flip.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1150">Intel XE#1150</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1473-f092ea99230dda54d66611f0c6facaacea827ae8/shard-adlp-2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-b-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v8/shard-adlp-2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-b-hdmi-a-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +2 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1473-f092ea99230dda54d66611f0c6facaacea827ae8/shard-adlp-1/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v8/shard-adlp-2/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1205">Intel XE#1205</a>) +2 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-modeset-hang@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1473-f092ea99230dda54d66611f0c6facaacea827ae8/shard-adlp-4/igt@kms_vblank@ts-continuation-modeset-hang@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v8/shard-adlp-9/igt@kms_vblank@ts-continuation-modeset-hang@pipe-a-hdmi-a-1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034">Intel XE#1034</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1473-f092ea99230dda54d66611f0c6facaacea827ae8/shard-adlp-4/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v8/shard-adlp-6/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1473-f092ea99230dda54d66611f0c6facaacea827ae8/shard-adlp-1/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v8/shard-adlp-4/igt@kms_content_protection@uevent.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1507">Intel XE#1507</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1473-f092ea99230dda54d66611f0c6facaacea827ae8/shard-adlp-2/igt@kms_vblank@ts-continuation-dpms-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034">Intel XE#1034</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v8/shard-adlp-6/igt@kms_vblank@ts-continuation-dpms-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034">Intel XE#1034</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1473-f092ea99230dda54d66611f0c6facaacea827ae8/shard-adlp-2/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134308v8/shard-adlp-6/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034">Intel XE#1034</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1473-f092ea99230dda54d66611f0c6facaacea827ae8 -&gt; xe-pw-134308v8</li>
</ul>
<p>IGT_7889: 9dca15da37f2a385b04427eb39cd460224d09c25 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1473-f092ea99230dda54d66611f0c6facaacea827ae8: f092ea99230dda54d66611f0c6facaacea827ae8<br />
  xe-pw-134308v8: 134308v8</p>

</body>
</html>

--===============5914366432658464883==--
