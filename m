Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E015C0218B
	for <intel-xe@archiver.kernel.org>; Fri, 24 Jan 2025 16:15:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA80610E9DD;
	Fri, 24 Jan 2025 16:15:58 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CC0A10E9DD;
 Fri, 24 Jan 2025 16:15:57 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2101125606199905854=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_Use_VRR_timing_generator_fo?=
 =?utf-8?q?r_fixed_refresh_rate_modes_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 24 Jan 2025 16:15:57 -0000
Message-ID: <173773535710.4056260.671305741965495649@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250124150020.2271747-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20250124150020.2271747-1-ankit.k.nautiyal@intel.com>
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

--===============2101125606199905854==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Use VRR timing generator for fixed refresh rate modes (rev2)
URL   : https://patchwork.freedesktop.org/series/141152/
State : failure

== Summary ==

CI Bug Log - changes from xe-2548-897537fb818365733977947214c799d61675895f_BAT -> xe-pw-141152v2_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-141152v2_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-141152v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (7 -> 7)
------------------------------

  Additional (1): bat-bmg-2 
  Missing    (1): bat-adlp-vm 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-141152v2_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:
    - bat-lnl-1:          [PASS][1] -> [DMESG-WARN][2] +7 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/bat-lnl-1/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/bat-lnl-1/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html

  * igt@kms_force_connector_basic@force-connector-state:
    - bat-bmg-2:          NOTRUN -> [DMESG-WARN][3] +1 other test dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/bat-bmg-2/igt@kms_force_connector_basic@force-connector-state.html

  
Known issues
------------

  Here are the changes found in xe-pw-141152v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@nullptr:
    - bat-bmg-2:          NOTRUN -> [SKIP][4] ([Intel XE#2134]) +4 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/bat-bmg-2/igt@fbdev@nullptr.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-bmg-2:          NOTRUN -> [SKIP][5] ([Intel XE#2233])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/bat-bmg-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:
    - bat-bmg-2:          NOTRUN -> [SKIP][6] ([Intel XE#2489] / [Intel XE#3419]) +13 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/bat-bmg-2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html

  * igt@kms_flip@basic-flip-vs-dpms@a-edp1:
    - bat-lnl-1:          [PASS][7] -> [DMESG-FAIL][8] ([Intel XE#324])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/bat-lnl-1/igt@kms_flip@basic-flip-vs-dpms@a-edp1.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/bat-lnl-1/igt@kms_flip@basic-flip-vs-dpms@a-edp1.html

  * igt@kms_flip@basic-flip-vs-dpms@c-edp1:
    - bat-lnl-1:          [PASS][9] -> [DMESG-WARN][10] ([Intel XE#1727] / [Intel XE#324]) +3 other tests dmesg-warn
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/bat-lnl-1/igt@kms_flip@basic-flip-vs-dpms@c-edp1.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/bat-lnl-1/igt@kms_flip@basic-flip-vs-dpms@c-edp1.html

  * igt@kms_flip@basic-flip-vs-modeset:
    - bat-lnl-1:          [PASS][11] -> [DMESG-FAIL][12] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#324])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/bat-lnl-1/igt@kms_flip@basic-flip-vs-modeset.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/bat-lnl-1/igt@kms_flip@basic-flip-vs-modeset.html
    - bat-bmg-2:          NOTRUN -> [SKIP][13] ([Intel XE#2482]) +3 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/bat-bmg-2/igt@kms_flip@basic-flip-vs-modeset.html

  * igt@kms_flip@basic-flip-vs-modeset@a-edp1:
    - bat-lnl-1:          [PASS][14] -> [DMESG-FAIL][15] ([Intel XE#1727]) +1 other test dmesg-fail
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/bat-lnl-1/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/bat-lnl-1/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html

  * igt@kms_flip@basic-flip-vs-modeset@b-edp1:
    - bat-lnl-1:          [PASS][16] -> [DMESG-WARN][17] ([Intel XE#1727]) +1 other test dmesg-warn
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/bat-lnl-1/igt@kms_flip@basic-flip-vs-modeset@b-edp1.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/bat-lnl-1/igt@kms_flip@basic-flip-vs-modeset@b-edp1.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-lnl-1:          [PASS][18] -> [DMESG-FAIL][19] ([Intel XE#1727] / [Intel XE#324]) +4 other tests dmesg-fail
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-bmg-2:          NOTRUN -> [SKIP][20] ([Intel XE#2434] / [Intel XE#2548])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/bat-bmg-2/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_psr@psr-primary-page-flip:
    - bat-bmg-2:          NOTRUN -> [SKIP][21] ([Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/bat-bmg-2/igt@kms_psr@psr-primary-page-flip.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - bat-bmg-2:          NOTRUN -> [SKIP][22] ([Intel XE#1091] / [Intel XE#2849]) +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/bat-bmg-2/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_intel_bb@render:
    - bat-adlp-vf:        [PASS][23] -> [DMESG-WARN][24] ([Intel XE#4078]) +1 other test dmesg-warn
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/bat-adlp-vf/igt@xe_intel_bb@render.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/bat-adlp-vf/igt@xe_intel_bb@render.html

  * igt@xe_live_ktest@xe_dma_buf:
    - bat-bmg-2:          NOTRUN -> [SKIP][25] ([Intel XE#1192]) +2 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html

  * igt@xe_live_ktest@xe_migrate:
    - bat-adlp-vf:        [PASS][26] -> [SKIP][27] ([Intel XE#1192]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-bmg-2:          NOTRUN -> [SKIP][28] ([Intel XE#1420])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/bat-bmg-2/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelp:
    - bat-bmg-2:          NOTRUN -> [SKIP][29] ([Intel XE#2245])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/bat-bmg-2/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@pat-index-xelpg:
    - bat-bmg-2:          NOTRUN -> [SKIP][30] ([Intel XE#2236])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/bat-bmg-2/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - bat-bmg-2:          NOTRUN -> [SKIP][31] ([Intel XE#3342])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/bat-bmg-2/igt@xe_sriov_flr@flr-vf1-clear.html

  
#### Warnings ####

  * igt@xe_live_ktest@xe_bo:
    - bat-adlp-vf:        [SKIP][32] ([Intel XE#2229] / [Intel XE#455]) -> [SKIP][33] ([Intel XE#1192])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html

  
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
  [Intel XE#2434]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2434
  [Intel XE#2482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482
  [Intel XE#2489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2489
  [Intel XE#2548]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3419]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3419
  [Intel XE#4078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4078
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455


Build changes
-------------

  * IGT: IGT_8207 -> IGT_8208
  * Linux: xe-2548-897537fb818365733977947214c799d61675895f -> xe-pw-141152v2

  IGT_8207: 9f36f9f9e8825a67b762630c2b31628ddcda5c10 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8208: 24c50086b0441a44e3eab291d0c34e716565041b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2548-897537fb818365733977947214c799d61675895f: 897537fb818365733977947214c799d61675895f
  xe-pw-141152v2: 141152v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/index.html

--===============2101125606199905854==
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
<tr><td><b>Series:</b></td><td>Use VRR timing generator for fixed refresh rate modes (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/141152/">https://patchwork.freedesktop.org/series/141152/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2548-897537fb818365733977947214c799d61675895f_BAT -&gt; xe-pw-141152v2_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-141152v2_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-141152v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>Additional (1): bat-bmg-2 <br />
  Missing    (1): bat-adlp-vm </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-141152v2_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/bat-lnl-1/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/bat-lnl-1/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">DMESG-WARN</a> +7 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/bat-bmg-2/igt@kms_force_connector_basic@force-connector-state.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-141152v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/bat-bmg-2/igt@fbdev@nullptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/bat-bmg-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233">Intel XE#2233</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/bat-bmg-2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2489">Intel XE#2489</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3419">Intel XE#3419</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@a-edp1:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/bat-lnl-1/igt@kms_flip@basic-flip-vs-dpms@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/bat-lnl-1/igt@kms_flip@basic-flip-vs-dpms@a-edp1.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@c-edp1:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/bat-lnl-1/igt@kms_flip@basic-flip-vs-dpms@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/bat-lnl-1/igt@kms_flip@basic-flip-vs-dpms@c-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/bat-lnl-1/igt@kms_flip@basic-flip-vs-modeset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/bat-lnl-1/igt@kms_flip@basic-flip-vs-modeset.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/bat-bmg-2/igt@kms_flip@basic-flip-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482">Intel XE#2482</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@a-edp1:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/bat-lnl-1/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/bat-lnl-1/igt@kms_flip@basic-flip-vs-modeset@a-edp1.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@b-edp1:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/bat-lnl-1/igt@kms_flip@basic-flip-vs-modeset@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/bat-lnl-1/igt@kms_flip@basic-flip-vs-modeset@b-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +4 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/bat-bmg-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2434">Intel XE#2434</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/bat-bmg-2/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/bat-bmg-2/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@render:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/bat-adlp-vf/igt@xe_intel_bb@render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/bat-adlp-vf/igt@xe_intel_bb@render.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4078">Intel XE#4078</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/bat-bmg-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/bat-bmg-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/bat-bmg-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236">Intel XE#2236</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/bat-bmg-2/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_live_ktest@xe_bo:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2548-897537fb818365733977947214c799d61675895f/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v2/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8207 -&gt; IGT_8208</li>
<li>Linux: xe-2548-897537fb818365733977947214c799d61675895f -&gt; xe-pw-141152v2</li>
</ul>
<p>IGT_8207: 9f36f9f9e8825a67b762630c2b31628ddcda5c10 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8208: 24c50086b0441a44e3eab291d0c34e716565041b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2548-897537fb818365733977947214c799d61675895f: 897537fb818365733977947214c799d61675895f<br />
  xe-pw-141152v2: 141152v2</p>

</body>
</html>

--===============2101125606199905854==--
