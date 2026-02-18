Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3D51E9A02C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Feb 2026 19:12:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 817A610E19B;
	Wed, 18 Feb 2026 19:12:49 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5810610E19B;
 Wed, 18 Feb 2026 19:12:48 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5011433609776783687=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/i915/overlay=3A_Convert?=
 =?utf-8?q?_to_parent_interface?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 18 Feb 2026 19:12:48 -0000
Message-ID: <177144196833.262680.16600003143178220459@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260218152806.18885-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20260218152806.18885-1-ville.syrjala@linux.intel.com>
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

--===============5011433609776783687==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/overlay: Convert to parent interface
URL   : https://patchwork.freedesktop.org/series/161766/
State : failure

== Summary ==

CI Bug Log - changes from xe-4573-7ee0795cb4f30c9ccc2b8a580faebcefbdf150c5_BAT -> xe-pw-161766v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-161766v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-161766v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (13 -> 14)
------------------------------

  Additional (1): bat-bmg-2 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-161766v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-adlp-7:         [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4573-7ee0795cb4f30c9ccc2b8a580faebcefbdf150c5/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161766v1/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html
    - bat-ptl-2:          [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4573-7ee0795cb4f30c9ccc2b8a580faebcefbdf150c5/bat-ptl-2/igt@core_hotunplug@unbind-rebind.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161766v1/bat-ptl-2/igt@core_hotunplug@unbind-rebind.html
    - bat-bmg-2:          NOTRUN -> [ABORT][5]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161766v1/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html
    - bat-bmg-1:          [PASS][6] -> [ABORT][7]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4573-7ee0795cb4f30c9ccc2b8a580faebcefbdf150c5/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161766v1/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html
    - bat-lnl-2:          [PASS][8] -> [ABORT][9]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4573-7ee0795cb4f30c9ccc2b8a580faebcefbdf150c5/bat-lnl-2/igt@core_hotunplug@unbind-rebind.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161766v1/bat-lnl-2/igt@core_hotunplug@unbind-rebind.html
    - bat-dg2-oem2:       [PASS][10] -> [ABORT][11]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4573-7ee0795cb4f30c9ccc2b8a580faebcefbdf150c5/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161766v1/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html
    - bat-wcl-1:          [PASS][12] -> [ABORT][13]
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4573-7ee0795cb4f30c9ccc2b8a580faebcefbdf150c5/bat-wcl-1/igt@core_hotunplug@unbind-rebind.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161766v1/bat-wcl-1/igt@core_hotunplug@unbind-rebind.html
    - bat-ptl-1:          [PASS][14] -> [ABORT][15]
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4573-7ee0795cb4f30c9ccc2b8a580faebcefbdf150c5/bat-ptl-1/igt@core_hotunplug@unbind-rebind.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161766v1/bat-ptl-1/igt@core_hotunplug@unbind-rebind.html
    - bat-wcl-2:          [PASS][16] -> [ABORT][17]
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4573-7ee0795cb4f30c9ccc2b8a580faebcefbdf150c5/bat-wcl-2/igt@core_hotunplug@unbind-rebind.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161766v1/bat-wcl-2/igt@core_hotunplug@unbind-rebind.html
    - bat-lnl-1:          [PASS][18] -> [ABORT][19]
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4573-7ee0795cb4f30c9ccc2b8a580faebcefbdf150c5/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161766v1/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html

  
Known issues
------------

  Here are the changes found in xe-pw-161766v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@write:
    - bat-bmg-2:          NOTRUN -> [SKIP][20] ([Intel XE#2134]) +4 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161766v1/bat-bmg-2/igt@fbdev@write.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-bmg-2:          NOTRUN -> [SKIP][21] ([Intel XE#2233])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161766v1/bat-bmg-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:
    - bat-bmg-2:          NOTRUN -> [SKIP][22] ([Intel XE#2489] / [Intel XE#3419]) +13 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161766v1/bat-bmg-2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html

  * igt@kms_flip@basic-flip-vs-modeset:
    - bat-bmg-2:          NOTRUN -> [SKIP][23] ([Intel XE#2482]) +3 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161766v1/bat-bmg-2/igt@kms_flip@basic-flip-vs-modeset.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-bmg-2:          NOTRUN -> [SKIP][24] ([Intel XE#2434] / [Intel XE#2548] / [Intel XE#6314])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161766v1/bat-bmg-2/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - bat-bmg-2:          NOTRUN -> [SKIP][25] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161766v1/bat-bmg-2/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-bmg-2:          NOTRUN -> [SKIP][26] ([Intel XE#1420])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161766v1/bat-bmg-2/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelp:
    - bat-bmg-2:          NOTRUN -> [SKIP][27] ([Intel XE#2245])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161766v1/bat-bmg-2/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@pat-index-xelpg:
    - bat-bmg-2:          NOTRUN -> [SKIP][28] ([Intel XE#2236])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161766v1/bat-bmg-2/igt@xe_pat@pat-index-xelpg.html

  
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
  [Intel XE#2434]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2434
  [Intel XE#2482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482
  [Intel XE#2489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2489
  [Intel XE#2548]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#3419]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3419
  [Intel XE#6314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314


Build changes
-------------

  * Linux: xe-4573-7ee0795cb4f30c9ccc2b8a580faebcefbdf150c5 -> xe-pw-161766v1

  IGT_8760: 8760
  xe-4573-7ee0795cb4f30c9ccc2b8a580faebcefbdf150c5: 7ee0795cb4f30c9ccc2b8a580faebcefbdf150c5
  xe-pw-161766v1: 161766v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161766v1/index.html

--===============5011433609776783687==
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
<tr><td><b>Series:</b></td><td>drm/i915/overlay: Convert to parent interface</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/161766/">https://patchwork.freedesktop.org/series/161766/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161766v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161766v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4573-7ee0795cb4f30c9ccc2b8a580faebcefbdf150c5_BAT -&gt; xe-pw-161766v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-161766v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-161766v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (13 -&gt; 14)</h2>
<p>Additional (1): bat-bmg-2 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-161766v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4573-7ee0795cb4f30c9ccc2b8a580faebcefbdf150c5/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161766v1/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html">ABORT</a></li>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4573-7ee0795cb4f30c9ccc2b8a580faebcefbdf150c5/bat-ptl-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161766v1/bat-ptl-2/igt@core_hotunplug@unbind-rebind.html">ABORT</a></li>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161766v1/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">ABORT</a></li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4573-7ee0795cb4f30c9ccc2b8a580faebcefbdf150c5/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161766v1/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html">ABORT</a></li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4573-7ee0795cb4f30c9ccc2b8a580faebcefbdf150c5/bat-lnl-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161766v1/bat-lnl-2/igt@core_hotunplug@unbind-rebind.html">ABORT</a></li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4573-7ee0795cb4f30c9ccc2b8a580faebcefbdf150c5/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161766v1/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html">ABORT</a></li>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4573-7ee0795cb4f30c9ccc2b8a580faebcefbdf150c5/bat-wcl-1/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161766v1/bat-wcl-1/igt@core_hotunplug@unbind-rebind.html">ABORT</a></li>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4573-7ee0795cb4f30c9ccc2b8a580faebcefbdf150c5/bat-ptl-1/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161766v1/bat-ptl-1/igt@core_hotunplug@unbind-rebind.html">ABORT</a></li>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4573-7ee0795cb4f30c9ccc2b8a580faebcefbdf150c5/bat-wcl-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161766v1/bat-wcl-2/igt@core_hotunplug@unbind-rebind.html">ABORT</a></li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4573-7ee0795cb4f30c9ccc2b8a580faebcefbdf150c5/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161766v1/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-161766v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161766v1/bat-bmg-2/igt@fbdev@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161766v1/bat-bmg-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233">Intel XE#2233</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161766v1/bat-bmg-2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2489">Intel XE#2489</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3419">Intel XE#3419</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161766v1/bat-bmg-2/igt@kms_flip@basic-flip-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482">Intel XE#2482</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161766v1/bat-bmg-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2434">Intel XE#2434</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161766v1/bat-bmg-2/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161766v1/bat-bmg-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161766v1/bat-bmg-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161766v1/bat-bmg-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236">Intel XE#2236</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4573-7ee0795cb4f30c9ccc2b8a580faebcefbdf150c5 -&gt; xe-pw-161766v1</li>
</ul>
<p>IGT_8760: 8760<br />
  xe-4573-7ee0795cb4f30c9ccc2b8a580faebcefbdf150c5: 7ee0795cb4f30c9ccc2b8a580faebcefbdf150c5<br />
  xe-pw-161766v1: 161766v1</p>

</body>
</html>

--===============5011433609776783687==--
