Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E143EE6BF03
	for <intel-xe@archiver.kernel.org>; Fri, 30 Jan 2026 11:24:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DDE310E179;
	Fri, 30 Jan 2026 11:24:48 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DE9B10E179;
 Fri, 30 Jan 2026 11:24:47 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3240219400423615272=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/display=3A_fix_the?=
 =?utf-8?q?_pixel_normalization_handling_for_xe3p=5Flpd_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinod Govindapillai" <vinod.govindapillai@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 30 Jan 2026 11:24:47 -0000
Message-ID: <176977228718.210469.9042093486102332240@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260130095919.107805-1-vinod.govindapillai@intel.com>
In-Reply-To: <20260130095919.107805-1-vinod.govindapillai@intel.com>
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

--===============3240219400423615272==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: fix the pixel normalization handling for xe3p_lpd (rev4)
URL   : https://patchwork.freedesktop.org/series/160254/
State : success

== Summary ==

CI Bug Log - changes from xe-4475-69c1143407ca17d556eb4e5ead7eb43b60a3fe65_BAT -> xe-pw-160254v4_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (10 -> 12)
------------------------------

  Additional (2): bat-adlp-vm bat-ptl-vm 

Known issues
------------

  Here are the changes found in xe-pw-160254v4_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_evict@evict-beng-small-cm:
    - bat-ptl-vm:         NOTRUN -> [SKIP][1] ([Intel XE#5764]) +10 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160254v4/bat-ptl-vm/igt@xe_evict@evict-beng-small-cm.html

  * igt@xe_evict@evict-small-external-cm:
    - bat-adlp-vm:        NOTRUN -> [SKIP][2] ([Intel XE#261] / [Intel XE#688]) +9 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160254v4/bat-adlp-vm/igt@xe_evict@evict-small-external-cm.html

  * igt@xe_evict_ccs@evict-overcommit-simple:
    - bat-adlp-vm:        NOTRUN -> [SKIP][3] ([Intel XE#688])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160254v4/bat-adlp-vm/igt@xe_evict_ccs@evict-overcommit-simple.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:
    - bat-adlp-vm:        NOTRUN -> [SKIP][4] ([Intel XE#288]) +32 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160254v4/bat-adlp-vm/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - bat-ptl-vm:         NOTRUN -> [SKIP][5] ([Intel XE#5775])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160254v4/bat-ptl-vm/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
    - bat-adlp-vm:        NOTRUN -> [SKIP][6] ([Intel XE#2229] / [Intel XE#5488])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160254v4/bat-adlp-vm/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_mmap@vram:
    - bat-adlp-vm:        NOTRUN -> [SKIP][7] ([Intel XE#1008] / [Intel XE#5591])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160254v4/bat-adlp-vm/igt@xe_mmap@vram.html
    - bat-ptl-vm:         NOTRUN -> [SKIP][8] ([Intel XE#5776])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160254v4/bat-ptl-vm/igt@xe_mmap@vram.html

  * igt@xe_pat@pat-index-xe2:
    - bat-adlp-vm:        NOTRUN -> [SKIP][9] ([Intel XE#977])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160254v4/bat-adlp-vm/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-ptl-vm:         NOTRUN -> [SKIP][10] ([Intel XE#5777])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160254v4/bat-ptl-vm/igt@xe_pat@pat-index-xehpc.html
    - bat-adlp-vm:        NOTRUN -> [SKIP][11] ([Intel XE#2838] / [Intel XE#979])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160254v4/bat-adlp-vm/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelp:
    - bat-ptl-vm:         NOTRUN -> [SKIP][12] ([Intel XE#5771])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160254v4/bat-ptl-vm/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@pat-index-xelpg:
    - bat-ptl-vm:         NOTRUN -> [SKIP][13] ([Intel XE#5780])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160254v4/bat-ptl-vm/igt@xe_pat@pat-index-xelpg.html
    - bat-adlp-vm:        NOTRUN -> [SKIP][14] ([Intel XE#979])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160254v4/bat-adlp-vm/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_waitfence@engine:
    - bat-bmg-2:          [PASS][15] -> [FAIL][16] ([Intel XE#6519])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4475-69c1143407ca17d556eb4e5ead7eb43b60a3fe65/bat-bmg-2/igt@xe_waitfence@engine.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160254v4/bat-bmg-2/igt@xe_waitfence@engine.html

  
  [Intel XE#1008]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#5488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5488
  [Intel XE#5591]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5591
  [Intel XE#5764]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764
  [Intel XE#5771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5771
  [Intel XE#5775]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5775
  [Intel XE#5776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5776
  [Intel XE#5777]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5777
  [Intel XE#5780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5780
  [Intel XE#6519]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * IGT: IGT_8725 -> IGT_8726
  * Linux: xe-4475-69c1143407ca17d556eb4e5ead7eb43b60a3fe65 -> xe-pw-160254v4

  IGT_8725: 8725
  IGT_8726: 8726
  xe-4475-69c1143407ca17d556eb4e5ead7eb43b60a3fe65: 69c1143407ca17d556eb4e5ead7eb43b60a3fe65
  xe-pw-160254v4: 160254v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160254v4/index.html

--===============3240219400423615272==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: fix the pixel normalization handling for xe3p_lpd (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/160254/">https://patchwork.freedesktop.org/series/160254/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160254v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160254v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4475-69c1143407ca17d556eb4e5ead7eb43b60a3fe65_BAT -&gt; xe-pw-160254v4_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (10 -&gt; 12)</h2>
<p>Additional (2): bat-adlp-vm bat-ptl-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-160254v4_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_evict@evict-beng-small-cm:</p>
<ul>
<li>bat-ptl-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160254v4/bat-ptl-vm/igt@xe_evict@evict-beng-small-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764">Intel XE#5764</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external-cm:</p>
<ul>
<li>bat-adlp-vm:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160254v4/bat-adlp-vm/igt@xe_evict@evict-small-external-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-simple:</p>
<ul>
<li>bat-adlp-vm:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160254v4/bat-adlp-vm/igt@xe_evict_ccs@evict-overcommit-simple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:</p>
<ul>
<li>bat-adlp-vm:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160254v4/bat-adlp-vm/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>bat-ptl-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160254v4/bat-ptl-vm/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5775">Intel XE#5775</a>)</li>
<li>bat-adlp-vm:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160254v4/bat-adlp-vm/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5488">Intel XE#5488</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>bat-adlp-vm:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160254v4/bat-adlp-vm/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008">Intel XE#1008</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5591">Intel XE#5591</a>)</li>
<li>bat-ptl-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160254v4/bat-ptl-vm/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5776">Intel XE#5776</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>bat-adlp-vm:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160254v4/bat-adlp-vm/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-ptl-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160254v4/bat-ptl-vm/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5777">Intel XE#5777</a>)</li>
<li>bat-adlp-vm:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160254v4/bat-adlp-vm/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>bat-ptl-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160254v4/bat-ptl-vm/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5771">Intel XE#5771</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>bat-ptl-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160254v4/bat-ptl-vm/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5780">Intel XE#5780</a>)</li>
<li>bat-adlp-vm:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160254v4/bat-adlp-vm/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@engine:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4475-69c1143407ca17d556eb4e5ead7eb43b60a3fe65/bat-bmg-2/igt@xe_waitfence@engine.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160254v4/bat-bmg-2/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519">Intel XE#6519</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8725 -&gt; IGT_8726</li>
<li>Linux: xe-4475-69c1143407ca17d556eb4e5ead7eb43b60a3fe65 -&gt; xe-pw-160254v4</li>
</ul>
<p>IGT_8725: 8725<br />
  IGT_8726: 8726<br />
  xe-4475-69c1143407ca17d556eb4e5ead7eb43b60a3fe65: 69c1143407ca17d556eb4e5ead7eb43b60a3fe65<br />
  xe-pw-160254v4: 160254v4</p>

</body>
</html>

--===============3240219400423615272==--
