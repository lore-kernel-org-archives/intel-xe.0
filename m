Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC000C02181
	for <intel-xe@archiver.kernel.org>; Fri, 24 Jan 2025 20:01:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 975BF10EA17;
	Fri, 24 Jan 2025 20:01:29 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EA9610E0C9;
 Fri, 24 Jan 2025 20:01:29 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2525764702500966610=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/cmtg=3A_Disable_th?=
 =?utf-8?q?e_CMTG_=28rev8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 24 Jan 2025 20:01:29 -0000
Message-ID: <173774888911.4167719.15932972474090331248@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250124173956.46534-1-gustavo.sousa@intel.com>
In-Reply-To: <20250124173956.46534-1-gustavo.sousa@intel.com>
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

--===============2525764702500966610==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/cmtg: Disable the CMTG (rev8)
URL   : https://patchwork.freedesktop.org/series/142946/
State : success

== Summary ==

CI Bug Log - changes from xe-2549-b36df02c99e3246ba2a90e951c71797327374db7_BAT -> xe-pw-142946v8_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (7 -> 7)
------------------------------

  Additional (1): bat-bmg-2 
  Missing    (1): bat-adlp-vm 

Known issues
------------

  Here are the changes found in xe-pw-142946v8_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@nullptr:
    - bat-bmg-2:          NOTRUN -> [SKIP][1] ([Intel XE#2134]) +4 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v8/bat-bmg-2/igt@fbdev@nullptr.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-bmg-2:          NOTRUN -> [SKIP][2] ([Intel XE#2233])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v8/bat-bmg-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:
    - bat-bmg-2:          NOTRUN -> [SKIP][3] ([Intel XE#2489] / [Intel XE#3419]) +13 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v8/bat-bmg-2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html

  * igt@kms_flip@basic-flip-vs-modeset:
    - bat-bmg-2:          NOTRUN -> [SKIP][4] ([Intel XE#2482]) +3 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v8/bat-bmg-2/igt@kms_flip@basic-flip-vs-modeset.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-bmg-2:          NOTRUN -> [SKIP][5] ([Intel XE#2434] / [Intel XE#2548])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v8/bat-bmg-2/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_psr@psr-primary-page-flip:
    - bat-bmg-2:          NOTRUN -> [SKIP][6] ([Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v8/bat-bmg-2/igt@kms_psr@psr-primary-page-flip.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - bat-bmg-2:          NOTRUN -> [SKIP][7] ([Intel XE#1091] / [Intel XE#2849]) +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v8/bat-bmg-2/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - bat-adlp-vf:        NOTRUN -> [SKIP][8] ([Intel XE#2229] / [Intel XE#455]) +1 other test skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v8/bat-adlp-vf/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - bat-bmg-2:          NOTRUN -> [SKIP][9] ([Intel XE#2229])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v8/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - bat-adlp-vf:        NOTRUN -> [SKIP][10] ([Intel XE#2229])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v8/bat-adlp-vf/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-bmg-2:          NOTRUN -> [SKIP][11] ([Intel XE#1420])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v8/bat-bmg-2/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelp:
    - bat-bmg-2:          NOTRUN -> [SKIP][12] ([Intel XE#2245])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v8/bat-bmg-2/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@pat-index-xelpg:
    - bat-bmg-2:          NOTRUN -> [SKIP][13] ([Intel XE#2236])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v8/bat-bmg-2/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - bat-bmg-2:          NOTRUN -> [SKIP][14] ([Intel XE#3342])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v8/bat-bmg-2/igt@xe_sriov_flr@flr-vf1-clear.html

  
#### Possible fixes ####

  * igt@xe_intel_bb@render:
    - bat-adlp-vf:        [DMESG-WARN][15] ([Intel XE#4078]) -> [PASS][16] +1 other test pass
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/bat-adlp-vf/igt@xe_intel_bb@render.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v8/bat-adlp-vf/igt@xe_intel_bb@render.html

  * igt@xe_live_ktest@xe_migrate:
    - bat-adlp-vf:        [SKIP][17] ([Intel XE#1192]) -> [PASS][18] +1 other test pass
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v8/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html

  
#### Warnings ####

  * igt@xe_live_ktest@xe_bo:
    - bat-adlp-vf:        [SKIP][19] ([Intel XE#1192]) -> [SKIP][20] ([Intel XE#2229] / [Intel XE#455])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v8/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html

  
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
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
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3419]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3419
  [Intel XE#4078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4078
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455


Build changes
-------------

  * Linux: xe-2549-b36df02c99e3246ba2a90e951c71797327374db7 -> xe-pw-142946v8

  IGT_8209: 07ec14a8b00849e82a6ee7aff433c8f564787bf0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2549-b36df02c99e3246ba2a90e951c71797327374db7: b36df02c99e3246ba2a90e951c71797327374db7
  xe-pw-142946v8: 142946v8

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v8/index.html

--===============2525764702500966610==
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
<tr><td><b>Series:</b></td><td>drm/i915/cmtg: Disable the CMTG (rev8)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/142946/">https://patchwork.freedesktop.org/series/142946/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v8/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v8/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2549-b36df02c99e3246ba2a90e951c71797327374db7_BAT -&gt; xe-pw-142946v8_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>Additional (1): bat-bmg-2 <br />
  Missing    (1): bat-adlp-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-142946v8_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v8/bat-bmg-2/igt@fbdev@nullptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v8/bat-bmg-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233">Intel XE#2233</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v8/bat-bmg-2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2489">Intel XE#2489</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3419">Intel XE#3419</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v8/bat-bmg-2/igt@kms_flip@basic-flip-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482">Intel XE#2482</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v8/bat-bmg-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2434">Intel XE#2434</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v8/bat-bmg-2/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v8/bat-bmg-2/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v8/bat-adlp-vf/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v8/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v8/bat-adlp-vf/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v8/bat-bmg-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v8/bat-bmg-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v8/bat-bmg-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236">Intel XE#2236</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v8/bat-bmg-2/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@xe_intel_bb@render:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/bat-adlp-vf/igt@xe_intel_bb@render.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4078">Intel XE#4078</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v8/bat-adlp-vf/igt@xe_intel_bb@render.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v8/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_live_ktest@xe_bo:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246ba2a90e951c71797327374db7/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v8/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2549-b36df02c99e3246ba2a90e951c71797327374db7 -&gt; xe-pw-142946v8</li>
</ul>
<p>IGT_8209: 07ec14a8b00849e82a6ee7aff433c8f564787bf0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2549-b36df02c99e3246ba2a90e951c71797327374db7: b36df02c99e3246ba2a90e951c71797327374db7<br />
  xe-pw-142946v8: 142946v8</p>

</body>
</html>

--===============2525764702500966610==--
