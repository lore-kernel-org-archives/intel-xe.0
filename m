Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E057C52D7C
	for <intel-xe@archiver.kernel.org>; Tue, 13 Aug 2024 20:00:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E27C510E2CD;
	Tue, 13 Aug 2024 20:00:37 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2763910E2CF;
 Tue, 13 Aug 2024 20:00:37 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0075901839671685500=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_drm/xe=3A_Rename_enable=5Fdispla?=
 =?utf-8?q?y_module_param_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 13 Aug 2024 20:00:37 -0000
Message-ID: <172357923715.614835.6239300345050764510@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240813191709.3285685-1-lucas.demarchi@intel.com>
In-Reply-To: <20240813191709.3285685-1-lucas.demarchi@intel.com>
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

--===============0075901839671685500==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Rename enable_display module param (rev3)
URL   : https://patchwork.freedesktop.org/series/137060/
State : failure

== Summary ==

CI Bug Log - changes from xe-1762-eb97e8bfe4c4f91fee7cfa354d300164f605aa83_BAT -> xe-pw-137060v3_BAT
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with xe-pw-137060v3_BAT need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-137060v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-137060v3_BAT:

### IGT changes ###

#### Warnings ####

  * igt@kms_flip@basic-flip-vs-dpms:
    - bat-lnl-2:          [SKIP][1] ([Intel XE#2235]) -> [SKIP][2] +11 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1762-eb97e8bfe4c4f91fee7cfa354d300164f605aa83/bat-lnl-2/igt@kms_flip@basic-flip-vs-dpms.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v3/bat-lnl-2/igt@kms_flip@basic-flip-vs-dpms.html

  
Known issues
------------

  Here are the changes found in xe-pw-137060v3_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@fbdev@nullptr:
    - {bat-bmg-2}:        [SKIP][3] ([Intel XE#2134]) -> [PASS][4] +4 other tests pass
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1762-eb97e8bfe4c4f91fee7cfa354d300164f605aa83/bat-bmg-2/igt@fbdev@nullptr.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v3/bat-bmg-2/igt@fbdev@nullptr.html

  * igt@kms_addfb_basic@bad-pitch-0:
    - bat-lnl-2:          [SKIP][5] ([Intel XE#2235]) -> [PASS][6] +29 other tests pass
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1762-eb97e8bfe4c4f91fee7cfa354d300164f605aa83/bat-lnl-2/igt@kms_addfb_basic@bad-pitch-0.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v3/bat-lnl-2/igt@kms_addfb_basic@bad-pitch-0.html

  * igt@kms_addfb_basic@bo-too-small:
    - {bat-bmg-2}:        [SKIP][7] ([Intel XE#2461]) -> [PASS][8] +29 other tests pass
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1762-eb97e8bfe4c4f91fee7cfa354d300164f605aa83/bat-bmg-2/igt@kms_addfb_basic@bo-too-small.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v3/bat-bmg-2/igt@kms_addfb_basic@bo-too-small.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:
    - {bat-bmg-2}:        [SKIP][9] ([Intel XE#2489]) -> [PASS][10] +10 other tests pass
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1762-eb97e8bfe4c4f91fee7cfa354d300164f605aa83/bat-bmg-2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v3/bat-bmg-2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html

  * igt@kms_force_connector_basic@force-connector-state:
    - {bat-bmg-2}:        [SKIP][11] ([Intel XE#540]) -> [PASS][12] +3 other tests pass
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1762-eb97e8bfe4c4f91fee7cfa354d300164f605aa83/bat-bmg-2/igt@kms_force_connector_basic@force-connector-state.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v3/bat-bmg-2/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_pipe_crc_basic@hang-read-crc:
    - {bat-bmg-2}:        [SKIP][13] ([Intel XE#829]) -> [PASS][14] +6 other tests pass
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1762-eb97e8bfe4c4f91fee7cfa354d300164f605aa83/bat-bmg-2/igt@kms_pipe_crc_basic@hang-read-crc.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v3/bat-bmg-2/igt@kms_pipe_crc_basic@hang-read-crc.html

  * igt@kms_prop_blob@basic:
    - {bat-bmg-2}:        [SKIP][15] ([Intel XE#780]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1762-eb97e8bfe4c4f91fee7cfa354d300164f605aa83/bat-bmg-2/igt@kms_prop_blob@basic.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v3/bat-bmg-2/igt@kms_prop_blob@basic.html
    - bat-lnl-2:          [SKIP][17] ([Intel XE#2235] / [Intel XE#780]) -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1762-eb97e8bfe4c4f91fee7cfa354d300164f605aa83/bat-lnl-2/igt@kms_prop_blob@basic.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v3/bat-lnl-2/igt@kms_prop_blob@basic.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-lnl-2:          [SKIP][19] ([Intel XE#2235]) -> [SKIP][20] ([Intel XE#1466] / [Intel XE#2235])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1762-eb97e8bfe4c4f91fee7cfa354d300164f605aa83/bat-lnl-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v3/bat-lnl-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_force_connector_basic@force-connector-state:
    - bat-lnl-2:          [SKIP][21] ([Intel XE#2235] / [Intel XE#540]) -> [SKIP][22] ([Intel XE#2235] / [Intel XE#352]) +2 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1762-eb97e8bfe4c4f91fee7cfa354d300164f605aa83/bat-lnl-2/igt@kms_force_connector_basic@force-connector-state.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v3/bat-lnl-2/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_hdmi_inject@inject-audio:
    - bat-lnl-2:          [SKIP][23] ([Intel XE#2235] / [Intel XE#540]) -> [SKIP][24] ([Intel XE#1470] / [Intel XE#2235])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1762-eb97e8bfe4c4f91fee7cfa354d300164f605aa83/bat-lnl-2/igt@kms_hdmi_inject@inject-audio.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v3/bat-lnl-2/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:
    - bat-lnl-2:          [SKIP][25] ([Intel XE#2235] / [Intel XE#829]) -> [SKIP][26] ([Intel XE#2235]) +6 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1762-eb97e8bfe4c4f91fee7cfa354d300164f605aa83/bat-lnl-2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v3/bat-lnl-2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html

  * igt@kms_psr@psr-cursor-plane-move:
    - bat-lnl-2:          [SKIP][27] ([Intel XE#2235]) -> [SKIP][28] ([Intel XE#929]) +2 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1762-eb97e8bfe4c4f91fee7cfa354d300164f605aa83/bat-lnl-2/igt@kms_psr@psr-cursor-plane-move.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v3/bat-lnl-2/igt@kms_psr@psr-cursor-plane-move.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466
  [Intel XE#1470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2235]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2461]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2461
  [Intel XE#2489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2489
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/540
  [Intel XE#780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/780
  [Intel XE#829]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/829
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929


Build changes
-------------

  * Linux: xe-1762-eb97e8bfe4c4f91fee7cfa354d300164f605aa83 -> xe-pw-137060v3

  IGT_7967: 290bdef9033c8b185922f02cd05d62fcc0091c15 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1762-eb97e8bfe4c4f91fee7cfa354d300164f605aa83: eb97e8bfe4c4f91fee7cfa354d300164f605aa83
  xe-pw-137060v3: 137060v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v3/index.html

--===============0075901839671685500==
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
<tr><td><b>Series:</b></td><td>drm/xe: Rename enable_display module param (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137060/">https://patchwork.freedesktop.org/series/137060/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1762-eb97e8bfe4c4f91fee7cfa354d300164f605aa83_BAT -&gt; xe-pw-137060v3_BAT</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with xe-pw-137060v3_BAT need to be verified<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-137060v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-137060v3_BAT:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-dpms:<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1762-eb97e8bfe4c4f91fee7cfa354d300164f605aa83/bat-lnl-2/igt@kms_flip@basic-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v3/bat-lnl-2/igt@kms_flip@basic-flip-vs-dpms.html">SKIP</a> +11 other tests skip</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-137060v3_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>{bat-bmg-2}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1762-eb97e8bfe4c4f91fee7cfa354d300164f605aa83/bat-bmg-2/igt@fbdev@nullptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v3/bat-bmg-2/igt@fbdev@nullptr.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bad-pitch-0:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1762-eb97e8bfe4c4f91fee7cfa354d300164f605aa83/bat-lnl-2/igt@kms_addfb_basic@bad-pitch-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v3/bat-lnl-2/igt@kms_addfb_basic@bad-pitch-0.html">PASS</a> +29 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bo-too-small:</p>
<ul>
<li>{bat-bmg-2}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1762-eb97e8bfe4c4f91fee7cfa354d300164f605aa83/bat-bmg-2/igt@kms_addfb_basic@bo-too-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2461">Intel XE#2461</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v3/bat-bmg-2/igt@kms_addfb_basic@bo-too-small.html">PASS</a> +29 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:</p>
<ul>
<li>{bat-bmg-2}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1762-eb97e8bfe4c4f91fee7cfa354d300164f605aa83/bat-bmg-2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2489">Intel XE#2489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v3/bat-bmg-2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">PASS</a> +10 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>{bat-bmg-2}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1762-eb97e8bfe4c4f91fee7cfa354d300164f605aa83/bat-bmg-2/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/540">Intel XE#540</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v3/bat-bmg-2/igt@kms_force_connector_basic@force-connector-state.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc:</p>
<ul>
<li>{bat-bmg-2}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1762-eb97e8bfe4c4f91fee7cfa354d300164f605aa83/bat-bmg-2/igt@kms_pipe_crc_basic@hang-read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v3/bat-bmg-2/igt@kms_pipe_crc_basic@hang-read-crc.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_prop_blob@basic:</p>
<ul>
<li>{bat-bmg-2}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1762-eb97e8bfe4c4f91fee7cfa354d300164f605aa83/bat-bmg-2/igt@kms_prop_blob@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/780">Intel XE#780</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v3/bat-bmg-2/igt@kms_prop_blob@basic.html">PASS</a></li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1762-eb97e8bfe4c4f91fee7cfa354d300164f605aa83/bat-lnl-2/igt@kms_prop_blob@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/780">Intel XE#780</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v3/bat-lnl-2/igt@kms_prop_blob@basic.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1762-eb97e8bfe4c4f91fee7cfa354d300164f605aa83/bat-lnl-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v3/bat-lnl-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466">Intel XE#1466</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1762-eb97e8bfe4c4f91fee7cfa354d300164f605aa83/bat-lnl-2/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/540">Intel XE#540</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v3/bat-lnl-2/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/352">Intel XE#352</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1762-eb97e8bfe4c4f91fee7cfa354d300164f605aa83/bat-lnl-2/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/540">Intel XE#540</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v3/bat-lnl-2/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470">Intel XE#1470</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1762-eb97e8bfe4c4f91fee7cfa354d300164f605aa83/bat-lnl-2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v3/bat-lnl-2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1762-eb97e8bfe4c4f91fee7cfa354d300164f605aa83/bat-lnl-2/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137060v3/bat-lnl-2/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1762-eb97e8bfe4c4f91fee7cfa354d300164f605aa83 -&gt; xe-pw-137060v3</li>
</ul>
<p>IGT_7967: 290bdef9033c8b185922f02cd05d62fcc0091c15 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1762-eb97e8bfe4c4f91fee7cfa354d300164f605aa83: eb97e8bfe4c4f91fee7cfa354d300164f605aa83<br />
  xe-pw-137060v3: 137060v3</p>

</body>
</html>

--===============0075901839671685500==--
