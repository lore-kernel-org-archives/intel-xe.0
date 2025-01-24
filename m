Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3597FC0218B
	for <intel-xe@archiver.kernel.org>; Fri, 24 Jan 2025 06:36:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D402310E2B3;
	Fri, 24 Jan 2025 06:36:14 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3327F10E2B3;
 Fri, 24 Jan 2025 06:36:13 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5473525824915073873=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_series_starting_with_=5BCI?=
 =?utf-8?q?=2C1/6=5D_drm/xe/pmu=3A_Enable_PMU_interface?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 24 Jan 2025 06:36:13 -0000
Message-ID: <173770057320.3899037.15266382921708884720@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250124050411.2189060-1-lucas.demarchi@intel.com>
In-Reply-To: <20250124050411.2189060-1-lucas.demarchi@intel.com>
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

--===============5473525824915073873==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [CI,1/6] drm/xe/pmu: Enable PMU interface
URL   : https://patchwork.freedesktop.org/series/143907/
State : success

== Summary ==

CI Bug Log - changes from xe-2544-47677a7a29ea3bd931fa767034ee1f9f2d6bf5d5_BAT -> xe-pw-143907v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (8 -> 8)
------------------------------

  Additional (1): bat-lnl-1 
  Missing    (1): bat-adlp-vm 

Known issues
------------

  Here are the changes found in xe-pw-143907v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-lnl-1:          NOTRUN -> [SKIP][1] ([Intel XE#1466])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143907v1/bat-lnl-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_dsc@dsc-basic:
    - bat-lnl-1:          NOTRUN -> [SKIP][2] ([Intel XE#2244])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143907v1/bat-lnl-1/igt@kms_dsc@dsc-basic.html

  * igt@kms_force_connector_basic@force-connector-state:
    - bat-lnl-1:          NOTRUN -> [SKIP][3] ([Intel XE#352]) +2 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143907v1/bat-lnl-1/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_hdmi_inject@inject-audio:
    - bat-lnl-1:          NOTRUN -> [SKIP][4] ([Intel XE#1470] / [Intel XE#2853])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143907v1/bat-lnl-1/igt@kms_hdmi_inject@inject-audio.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - bat-lnl-1:          NOTRUN -> [SKIP][5] ([Intel XE#1091] / [Intel XE#2849]) +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143907v1/bat-lnl-1/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_evict@evict-beng-small-cm:
    - bat-lnl-1:          NOTRUN -> [SKIP][6] ([Intel XE#688]) +11 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143907v1/bat-lnl-1/igt@xe_evict@evict-beng-small-cm.html

  * igt@xe_exec_balancer@twice-virtual-rebind:
    - bat-adlp-vf:        [PASS][7] -> [DMESG-WARN][8] ([Intel XE#4078])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2544-47677a7a29ea3bd931fa767034ee1f9f2d6bf5d5/bat-adlp-vf/igt@xe_exec_balancer@twice-virtual-rebind.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143907v1/bat-adlp-vf/igt@xe_exec_balancer@twice-virtual-rebind.html

  * igt@xe_live_ktest@xe_bo:
    - bat-lnl-1:          NOTRUN -> [SKIP][9] ([Intel XE#1192]) +2 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143907v1/bat-lnl-1/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_migrate:
    - bat-adlp-vf:        [PASS][10] -> [SKIP][11] ([Intel XE#1192]) +1 other test skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2544-47677a7a29ea3bd931fa767034ee1f9f2d6bf5d5/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143907v1/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_mmap@vram:
    - bat-lnl-1:          NOTRUN -> [SKIP][12] ([Intel XE#1416])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143907v1/bat-lnl-1/igt@xe_mmap@vram.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-lnl-1:          NOTRUN -> [SKIP][13] ([Intel XE#1420] / [Intel XE#2838])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143907v1/bat-lnl-1/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelp:
    - bat-lnl-1:          NOTRUN -> [SKIP][14] ([Intel XE#977])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143907v1/bat-lnl-1/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@pat-index-xelpg:
    - bat-lnl-1:          NOTRUN -> [SKIP][15] ([Intel XE#979])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143907v1/bat-lnl-1/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - bat-lnl-1:          NOTRUN -> [SKIP][16] ([Intel XE#3342])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143907v1/bat-lnl-1/igt@xe_sriov_flr@flr-vf1-clear.html

  * igt@xe_vm@bind-execqueues-independent:
    - bat-adlp-vf:        [PASS][17] -> [DMESG-WARN][18] ([Intel XE#3970] / [Intel XE#4078]) +1 other test dmesg-warn
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2544-47677a7a29ea3bd931fa767034ee1f9f2d6bf5d5/bat-adlp-vf/igt@xe_vm@bind-execqueues-independent.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143907v1/bat-adlp-vf/igt@xe_vm@bind-execqueues-independent.html

  
#### Warnings ####

  * igt@xe_live_ktest@xe_bo:
    - bat-adlp-vf:        [SKIP][19] ([Intel XE#2229] / [Intel XE#455]) -> [SKIP][20] ([Intel XE#1192])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2544-47677a7a29ea3bd931fa767034ee1f9f2d6bf5d5/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143907v1/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html

  
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466
  [Intel XE#1470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2853]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2853
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970
  [Intel XE#4078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4078
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * Linux: xe-2544-47677a7a29ea3bd931fa767034ee1f9f2d6bf5d5 -> xe-pw-143907v1

  IGT_8207: 9f36f9f9e8825a67b762630c2b31628ddcda5c10 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2544-47677a7a29ea3bd931fa767034ee1f9f2d6bf5d5: 47677a7a29ea3bd931fa767034ee1f9f2d6bf5d5
  xe-pw-143907v1: 143907v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143907v1/index.html

--===============5473525824915073873==
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
<tr><td><b>Series:</b></td><td>series starting with [CI,1/6] drm/xe/pmu: Enable PMU interface</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/143907/">https://patchwork.freedesktop.org/series/143907/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143907v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143907v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2544-47677a7a29ea3bd931fa767034ee1f9f2d6bf5d5_BAT -&gt; xe-pw-143907v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>Additional (1): bat-lnl-1 <br />
  Missing    (1): bat-adlp-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-143907v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143907v1/bat-lnl-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466">Intel XE#1466</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143907v1/bat-lnl-1/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143907v1/bat-lnl-1/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/352">Intel XE#352</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143907v1/bat-lnl-1/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470">Intel XE#1470</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2853">Intel XE#2853</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143907v1/bat-lnl-1/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-cm:</p>
<ul>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143907v1/bat-lnl-1/igt@xe_evict@evict-beng-small-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-virtual-rebind:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2544-47677a7a29ea3bd931fa767034ee1f9f2d6bf5d5/bat-adlp-vf/igt@xe_exec_balancer@twice-virtual-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143907v1/bat-adlp-vf/igt@xe_exec_balancer@twice-virtual-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4078">Intel XE#4078</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143907v1/bat-lnl-1/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2544-47677a7a29ea3bd931fa767034ee1f9f2d6bf5d5/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143907v1/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143907v1/bat-lnl-1/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416">Intel XE#1416</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143907v1/bat-lnl-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143907v1/bat-lnl-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143907v1/bat-lnl-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143907v1/bat-lnl-1/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@bind-execqueues-independent:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2544-47677a7a29ea3bd931fa767034ee1f9f2d6bf5d5/bat-adlp-vf/igt@xe_vm@bind-execqueues-independent.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143907v1/bat-adlp-vf/igt@xe_vm@bind-execqueues-independent.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4078">Intel XE#4078</a>) +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_live_ktest@xe_bo:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2544-47677a7a29ea3bd931fa767034ee1f9f2d6bf5d5/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143907v1/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2544-47677a7a29ea3bd931fa767034ee1f9f2d6bf5d5 -&gt; xe-pw-143907v1</li>
</ul>
<p>IGT_8207: 9f36f9f9e8825a67b762630c2b31628ddcda5c10 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2544-47677a7a29ea3bd931fa767034ee1f9f2d6bf5d5: 47677a7a29ea3bd931fa767034ee1f9f2d6bf5d5<br />
  xe-pw-143907v1: 143907v1</p>

</body>
</html>

--===============5473525824915073873==--
