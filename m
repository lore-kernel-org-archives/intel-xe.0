Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72763D767D4
	for <intel-xe@archiver.kernel.org>; Fri, 19 Dec 2025 11:00:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3371310EBA1;
	Fri, 19 Dec 2025 11:00:29 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D75A10E064;
 Fri, 19 Dec 2025 11:00:27 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4208880574964464817=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/vf=3A_Fix_up_GGTT_on?=
 =?utf-8?q?_S4_resume_under_SR-IOV_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 19 Dec 2025 11:00:27 -0000
Message-ID: <176614202731.105778.1031664979206356774@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251219095955.801776-1-satyanarayana.k.v.p@intel.com>
In-Reply-To: <20251219095955.801776-1-satyanarayana.k.v.p@intel.com>
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

--===============4208880574964464817==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/vf: Fix up GGTT on S4 resume under SR-IOV (rev5)
URL   : https://patchwork.freedesktop.org/series/153196/
State : success

== Summary ==

CI Bug Log - changes from xe-4273-515e6667d13b3a1ea3192f275982df95854ac89b_BAT -> xe-pw-153196v5_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-153196v5_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@eof:
    - bat-ptl-1:          NOTRUN -> [SKIP][1] ([Intel XE#5773]) +4 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153196v5/bat-ptl-1/igt@fbdev@eof.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-ptl-1:          NOTRUN -> [SKIP][2] ([Intel XE#5765])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153196v5/bat-ptl-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-bmg-1:          NOTRUN -> [SKIP][3] ([Intel XE#2233])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153196v5/bat-bmg-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-ptl-2:          NOTRUN -> [SKIP][4] ([Intel XE#5765])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153196v5/bat-ptl-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:
    - bat-ptl-1:          NOTRUN -> [SKIP][5] ([Intel XE#5766]) +13 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153196v5/bat-ptl-1/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html

  * igt@kms_dsc@dsc-basic:
    - bat-bmg-1:          NOTRUN -> [SKIP][6] ([Intel XE#2244])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153196v5/bat-bmg-1/igt@kms_dsc@dsc-basic.html
    - bat-ptl-2:          NOTRUN -> [SKIP][7] ([Intel XE#5774] / [Intel XE#5907] / [Intel XE#6203])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153196v5/bat-ptl-2/igt@kms_dsc@dsc-basic.html

  * igt@kms_flip@basic-flip-vs-modeset:
    - bat-ptl-1:          NOTRUN -> [SKIP][8] ([Intel XE#5769]) +3 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153196v5/bat-ptl-1/igt@kms_flip@basic-flip-vs-modeset.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-ptl-1:          NOTRUN -> [SKIP][9] ([Intel XE#5781])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153196v5/bat-ptl-1/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - bat-ptl-1:          NOTRUN -> [SKIP][10] ([Intel XE#1406] / [Intel XE#5778]) +2 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153196v5/bat-ptl-1/igt@kms_psr@psr-sprite-plane-onoff.html
    - bat-bmg-1:          NOTRUN -> [SKIP][11] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153196v5/bat-bmg-1/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@xe_evict@evict-beng-small:
    - bat-ptl-2:          NOTRUN -> [SKIP][12] ([Intel XE#5764]) +11 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153196v5/bat-ptl-2/igt@xe_evict@evict-beng-small.html

  * igt@xe_evict@evict-beng-small-cm:
    - bat-ptl-1:          NOTRUN -> [SKIP][13] ([Intel XE#5764]) +11 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153196v5/bat-ptl-1/igt@xe_evict@evict-beng-small-cm.html

  * igt@xe_live_ktest@xe_bo:
    - bat-ptl-1:          NOTRUN -> [SKIP][14] ([Intel XE#5775]) +2 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153196v5/bat-ptl-1/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - bat-ptl-2:          NOTRUN -> [SKIP][15] ([Intel XE#5775]) +2 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153196v5/bat-ptl-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - bat-bmg-1:          NOTRUN -> [SKIP][16] ([Intel XE#2229])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153196v5/bat-bmg-1/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_mmap@vram:
    - bat-ptl-1:          NOTRUN -> [SKIP][17] ([Intel XE#5776])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153196v5/bat-ptl-1/igt@xe_mmap@vram.html
    - bat-ptl-2:          NOTRUN -> [SKIP][18] ([Intel XE#5776])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153196v5/bat-ptl-2/igt@xe_mmap@vram.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-bmg-1:          NOTRUN -> [SKIP][19] ([Intel XE#1420])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153196v5/bat-bmg-1/igt@xe_pat@pat-index-xehpc.html
    - bat-ptl-2:          NOTRUN -> [SKIP][20] ([Intel XE#5777])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153196v5/bat-ptl-2/igt@xe_pat@pat-index-xehpc.html
    - bat-ptl-1:          NOTRUN -> [SKIP][21] ([Intel XE#5777])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153196v5/bat-ptl-1/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelp:
    - bat-bmg-1:          NOTRUN -> [SKIP][22] ([Intel XE#2245])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153196v5/bat-bmg-1/igt@xe_pat@pat-index-xelp.html
    - bat-ptl-2:          NOTRUN -> [SKIP][23] ([Intel XE#5771])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153196v5/bat-ptl-2/igt@xe_pat@pat-index-xelp.html
    - bat-ptl-1:          NOTRUN -> [SKIP][24] ([Intel XE#5771])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153196v5/bat-ptl-1/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@pat-index-xelpg:
    - bat-ptl-1:          NOTRUN -> [SKIP][25] ([Intel XE#5780])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153196v5/bat-ptl-1/igt@xe_pat@pat-index-xelpg.html
    - bat-bmg-1:          NOTRUN -> [SKIP][26] ([Intel XE#2236])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153196v5/bat-bmg-1/igt@xe_pat@pat-index-xelpg.html
    - bat-ptl-2:          NOTRUN -> [SKIP][27] ([Intel XE#5780])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153196v5/bat-ptl-2/igt@xe_pat@pat-index-xelpg.html

  
#### Possible fixes ####

  * igt@xe_module_load@load:
    - bat-bmg-1:          [ABORT][28] ([Intel XE#6818]) -> [PASS][29]
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4273-515e6667d13b3a1ea3192f275982df95854ac89b/bat-bmg-1/igt@xe_module_load@load.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153196v5/bat-bmg-1/igt@xe_module_load@load.html

  
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#5764]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764
  [Intel XE#5765]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5765
  [Intel XE#5766]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5766
  [Intel XE#5769]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5769
  [Intel XE#5771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5771
  [Intel XE#5773]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5773
  [Intel XE#5774]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5774
  [Intel XE#5775]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5775
  [Intel XE#5776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5776
  [Intel XE#5777]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5777
  [Intel XE#5778]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5778
  [Intel XE#5780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5780
  [Intel XE#5781]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5781
  [Intel XE#5907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5907
  [Intel XE#6203]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6203
  [Intel XE#6818]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6818


Build changes
-------------

  * Linux: xe-4273-515e6667d13b3a1ea3192f275982df95854ac89b -> xe-pw-153196v5

  IGT_8674: f38f4d8e9c65aff45ac807e646d06e38bc3193a2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4273-515e6667d13b3a1ea3192f275982df95854ac89b: 515e6667d13b3a1ea3192f275982df95854ac89b
  xe-pw-153196v5: 153196v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153196v5/index.html

--===============4208880574964464817==
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
<tr><td><b>Series:</b></td><td>drm/xe/vf: Fix up GGTT on S4 resume under SR-IOV (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/153196/">https://patchwork.freedesktop.org/series/153196/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153196v5/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153196v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4273-515e6667d13b3a1ea3192f275982df95854ac89b_BAT -&gt; xe-pw-153196v5_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-153196v5_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>bat-ptl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153196v5/bat-ptl-1/igt@fbdev@eof.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5773">Intel XE#5773</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-ptl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153196v5/bat-ptl-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5765">Intel XE#5765</a>)</li>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153196v5/bat-bmg-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233">Intel XE#2233</a>)</li>
<li>bat-ptl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153196v5/bat-ptl-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5765">Intel XE#5765</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:</p>
<ul>
<li>bat-ptl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153196v5/bat-ptl-1/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5766">Intel XE#5766</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153196v5/bat-bmg-1/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
<li>bat-ptl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153196v5/bat-ptl-2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5774">Intel XE#5774</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5907">Intel XE#5907</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6203">Intel XE#6203</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset:</p>
<ul>
<li>bat-ptl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153196v5/bat-ptl-1/igt@kms_flip@basic-flip-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5769">Intel XE#5769</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-ptl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153196v5/bat-ptl-1/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5781">Intel XE#5781</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>bat-ptl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153196v5/bat-ptl-1/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5778">Intel XE#5778</a>) +2 other tests skip</li>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153196v5/bat-bmg-1/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small:</p>
<ul>
<li>bat-ptl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153196v5/bat-ptl-2/igt@xe_evict@evict-beng-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764">Intel XE#5764</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-cm:</p>
<ul>
<li>bat-ptl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153196v5/bat-ptl-1/igt@xe_evict@evict-beng-small-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764">Intel XE#5764</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>bat-ptl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153196v5/bat-ptl-1/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5775">Intel XE#5775</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:</p>
<ul>
<li>bat-ptl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153196v5/bat-ptl-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5775">Intel XE#5775</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153196v5/bat-bmg-1/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>bat-ptl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153196v5/bat-ptl-1/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5776">Intel XE#5776</a>)</li>
<li>bat-ptl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153196v5/bat-ptl-2/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5776">Intel XE#5776</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153196v5/bat-bmg-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a>)</li>
<li>bat-ptl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153196v5/bat-ptl-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5777">Intel XE#5777</a>)</li>
<li>bat-ptl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153196v5/bat-ptl-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5777">Intel XE#5777</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153196v5/bat-bmg-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a>)</li>
<li>bat-ptl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153196v5/bat-ptl-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5771">Intel XE#5771</a>)</li>
<li>bat-ptl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153196v5/bat-ptl-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5771">Intel XE#5771</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>bat-ptl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153196v5/bat-ptl-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5780">Intel XE#5780</a>)</li>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153196v5/bat-bmg-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236">Intel XE#2236</a>)</li>
<li>bat-ptl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153196v5/bat-ptl-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5780">Intel XE#5780</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_module_load@load:<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4273-515e6667d13b3a1ea3192f275982df95854ac89b/bat-bmg-1/igt@xe_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6818">Intel XE#6818</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153196v5/bat-bmg-1/igt@xe_module_load@load.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4273-515e6667d13b3a1ea3192f275982df95854ac89b -&gt; xe-pw-153196v5</li>
</ul>
<p>IGT_8674: f38f4d8e9c65aff45ac807e646d06e38bc3193a2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4273-515e6667d13b3a1ea3192f275982df95854ac89b: 515e6667d13b3a1ea3192f275982df95854ac89b<br />
  xe-pw-153196v5: 153196v5</p>

</body>
</html>

--===============4208880574964464817==--
