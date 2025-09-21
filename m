Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC564CAC5A7
	for <intel-xe@archiver.kernel.org>; Sun, 21 Sep 2025 05:33:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 674E810E0B7;
	Sun, 21 Sep 2025 05:33:29 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4197010E0B7;
 Sun, 21 Sep 2025 05:33:28 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7614913959973121297=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_Introduce_set=5Fcontext=5Fl?=
 =?utf-8?q?atency_and_refactor_VRR/DSB_timing_logic?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sun, 21 Sep 2025 05:33:28 -0000
Message-ID: <175843280825.351355.2353026141226041738@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250921043535.2012978-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20250921043535.2012978-1-ankit.k.nautiyal@intel.com>
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

--===============7614913959973121297==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Introduce set_context_latency and refactor VRR/DSB timing logic
URL   : https://patchwork.freedesktop.org/series/154809/
State : failure

== Summary ==

CI Bug Log - changes from xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142_BAT -> xe-pw-154809v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-154809v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-154809v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (11 -> 9)
------------------------------

  Missing    (2): bat-adlp-vm bat-ptl-vm 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-154809v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:
    - bat-dg2-oem2:       [PASS][1] -> [FAIL][2] +6 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:
    - bat-lnl-1:          [PASS][3] -> [FAIL][4] +7 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/bat-lnl-1/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/bat-lnl-1/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-lnl-1:          [PASS][5] -> [DMESG-WARN][6] +7 other tests dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-hdmi-a3:
    - bat-bmg-1:          [PASS][7] -> [DMESG-WARN][8] +3 other tests dmesg-warn
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/bat-bmg-1/igt@kms_flip@basic-flip-vs-wf_vblank@a-hdmi-a3.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/bat-bmg-1/igt@kms_flip@basic-flip-vs-wf_vblank@a-hdmi-a3.html

  * igt@kms_flip@basic-plain-flip:
    - bat-bmg-1:          [PASS][9] -> [DMESG-FAIL][10] +1 other test dmesg-fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/bat-bmg-1/igt@kms_flip@basic-plain-flip.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/bat-bmg-1/igt@kms_flip@basic-plain-flip.html
    - bat-lnl-1:          [PASS][11] -> [DMESG-FAIL][12] +1 other test dmesg-fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/bat-lnl-1/igt@kms_flip@basic-plain-flip.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/bat-lnl-1/igt@kms_flip@basic-plain-flip.html

  * igt@kms_flip@basic-plain-flip@b-hdmi-a3:
    - bat-bmg-1:          [PASS][13] -> [FAIL][14] +8 other tests fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/bat-bmg-1/igt@kms_flip@basic-plain-flip@b-hdmi-a3.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/bat-bmg-1/igt@kms_flip@basic-plain-flip@b-hdmi-a3.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
    - {bat-ptl-2}:        [PASS][15] -> [FAIL][16] +8 other tests fail
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/bat-ptl-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/bat-ptl-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:
    - {bat-ptl-2}:        [PASS][17] -> [DMESG-WARN][18] +3 other tests dmesg-warn
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/bat-ptl-2/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/bat-ptl-2/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html

  * igt@kms_flip@basic-plain-flip:
    - {bat-ptl-2}:        [PASS][19] -> [DMESG-FAIL][20] +1 other test dmesg-fail
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/bat-ptl-2/igt@kms_flip@basic-plain-flip.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/bat-ptl-2/igt@kms_flip@basic-plain-flip.html

  
Known issues
------------

  Here are the changes found in xe-pw-154809v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
    - bat-dg2-oem2:       [PASS][21] -> [DMESG-FAIL][22] ([Intel XE#4543]) +3 other tests dmesg-fail
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - bat-dg2-oem2:       [PASS][23] -> [DMESG-WARN][24] ([Intel XE#4543]) +8 other tests dmesg-warn
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/bat-dg2-oem2/igt@kms_pipe_crc_basic@nonblocking-crc.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@nonblocking-crc.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543


Build changes
-------------

  * Linux: xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142 -> xe-pw-154809v1

  IGT_8546: 8546
  xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142: cfa128d879d8cdea4007ddd56dcc2eac73ff2142
  xe-pw-154809v1: 154809v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/index.html

--===============7614913959973121297==
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
<tr><td><b>Series:</b></td><td>Introduce set_context_latency and refactor VRR/DSB timing logic</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/154809/">https://patchwork.freedesktop.org/series/154809/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142_BAT -&gt; xe-pw-154809v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-154809v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-154809v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (11 -&gt; 9)</h2>
<p>Missing    (2): bat-adlp-vm bat-ptl-vm </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-154809v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">FAIL</a> +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/bat-lnl-1/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/bat-lnl-1/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">FAIL</a> +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html">DMESG-WARN</a> +7 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-hdmi-a3:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/bat-bmg-1/igt@kms_flip@basic-flip-vs-wf_vblank@a-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/bat-bmg-1/igt@kms_flip@basic-flip-vs-wf_vblank@a-hdmi-a3.html">DMESG-WARN</a> +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/bat-bmg-1/igt@kms_flip@basic-plain-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/bat-bmg-1/igt@kms_flip@basic-plain-flip.html">DMESG-FAIL</a> +1 other test dmesg-fail</li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/bat-lnl-1/igt@kms_flip@basic-plain-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/bat-lnl-1/igt@kms_flip@basic-plain-flip.html">DMESG-FAIL</a> +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@b-hdmi-a3:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/bat-bmg-1/igt@kms_flip@basic-plain-flip@b-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/bat-bmg-1/igt@kms_flip@basic-plain-flip@b-hdmi-a3.html">FAIL</a> +8 other tests fail</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:</p>
<ul>
<li>{bat-ptl-2}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/bat-ptl-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/bat-ptl-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">FAIL</a> +8 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:</p>
<ul>
<li>{bat-ptl-2}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/bat-ptl-2/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/bat-ptl-2/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html">DMESG-WARN</a> +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip:</p>
<ul>
<li>{bat-ptl-2}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/bat-ptl-2/igt@kms_flip@basic-plain-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/bat-ptl-2/igt@kms_flip@basic-plain-flip.html">DMESG-FAIL</a> +1 other test dmesg-fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-154809v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +3 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142/bat-dg2-oem2/igt@kms_pipe_crc_basic@nonblocking-crc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154809v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@nonblocking-crc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +8 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142 -&gt; xe-pw-154809v1</li>
</ul>
<p>IGT_8546: 8546<br />
  xe-3803-cfa128d879d8cdea4007ddd56dcc2eac73ff2142: cfa128d879d8cdea4007ddd56dcc2eac73ff2142<br />
  xe-pw-154809v1: 154809v1</p>

</body>
</html>

--===============7614913959973121297==--
