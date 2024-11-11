Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E513D2E9CF
	for <intel-xe@archiver.kernel.org>; Mon, 11 Nov 2024 09:56:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 046FB10E1DA;
	Mon, 11 Nov 2024 09:56:14 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9759210E1DA;
 Mon, 11 Nov 2024 09:56:12 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6958383179109093064=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_Use_VRR_timing_generator_for_fix?=
 =?utf-8?q?ed_refresh_rate_modes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 11 Nov 2024 09:56:12 -0000
Message-ID: <173131897261.2555084.1442781323072174346@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241111091221.2992818-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20241111091221.2992818-1-ankit.k.nautiyal@intel.com>
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

--===============6958383179109093064==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Use VRR timing generator for fixed refresh rate modes
URL   : https://patchwork.freedesktop.org/series/141152/
State : failure

== Summary ==

CI Bug Log - changes from xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad_BAT -> xe-pw-141152v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-141152v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-141152v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-141152v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_force_connector_basic@force-connector-state:
    - bat-bmg-2:          [PASS][1] -> [DMESG-WARN][2] +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/bat-bmg-2/igt@kms_force_connector_basic@force-connector-state.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/bat-bmg-2/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - bat-dg2-oem2:       [PASS][3] -> [DMESG-WARN][4] +58 other tests dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/bat-dg2-oem2/igt@kms_pipe_crc_basic@nonblocking-crc.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@nonblocking-crc.html

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-hdmi-a-3:
    - bat-bmg-1:          [PASS][5] -> [DMESG-WARN][6] +58 other tests dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/bat-bmg-1/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-hdmi-a-3.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/bat-bmg-1/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-hdmi-a-3.html

  * igt@kms_psr@psr-cursor-plane-move:
    - bat-adlp-7:         [PASS][7] -> [DMESG-WARN][8] +70 other tests dmesg-warn
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html

  
#### Warnings ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [FAIL][9] ([Intel XE#1861]) -> [DMESG-WARN][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  
Known issues
------------

  Here are the changes found in xe-pw-141152v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_live_ktest@xe_dma_buf:
    - bat-bmg-2:          [PASS][11] -> [SKIP][12] ([Intel XE#1192]) +2 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html

  * igt@xe_live_ktest@xe_migrate:
    - bat-bmg-1:          [PASS][13] -> [SKIP][14] ([Intel XE#1192]) +2 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html
    - bat-adlp-7:         [PASS][15] -> [SKIP][16] ([Intel XE#1192]) +2 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/bat-adlp-7/igt@xe_live_ktest@xe_migrate.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/bat-adlp-7/igt@xe_live_ktest@xe_migrate.html
    - bat-dg2-oem2:       [PASS][17] -> [SKIP][18] ([Intel XE#1192]) +2 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html

  
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861


Build changes
-------------

  * Linux: xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad -> xe-pw-141152v1

  IGT_8102: a05b40911bfb79c9bdf6ff7e8ab1a68948afbbf6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad: b69d9ffb08bcd3a2810da52a79114661097d23ad
  xe-pw-141152v1: 141152v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/index.html

--===============6958383179109093064==
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
<tr><td><b>Series:</b></td><td>Use VRR timing generator for fixed refresh rate modes</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/141152/">https://patchwork.freedesktop.org/series/141152/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad_BAT -&gt; xe-pw-141152v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-141152v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-141152v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-141152v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/bat-bmg-2/igt@kms_force_connector_basic@force-connector-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/bat-bmg-2/igt@kms_force_connector_basic@force-connector-state.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/bat-dg2-oem2/igt@kms_pipe_crc_basic@nonblocking-crc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@nonblocking-crc.html">DMESG-WARN</a> +58 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-hdmi-a-3:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/bat-bmg-1/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-hdmi-a-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/bat-bmg-1/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-d-hdmi-a-3.html">DMESG-WARN</a> +58 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html">DMESG-WARN</a> +70 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@basic:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-141152v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +2 other tests skip</li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/bat-adlp-7/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/bat-adlp-7/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +2 other tests skip</li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad -&gt; xe-pw-141152v1</li>
</ul>
<p>IGT_8102: a05b40911bfb79c9bdf6ff7e8ab1a68948afbbf6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad: b69d9ffb08bcd3a2810da52a79114661097d23ad<br />
  xe-pw-141152v1: 141152v1</p>

</body>
</html>

--===============6958383179109093064==--
