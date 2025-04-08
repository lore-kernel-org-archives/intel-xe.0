Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A3B5C36010
	for <intel-xe@archiver.kernel.org>; Tue,  8 Apr 2025 22:55:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4F2610E78B;
	Tue,  8 Apr 2025 22:55:10 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F03A10E78B;
 Tue,  8 Apr 2025 22:55:09 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2150585042713864814=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/display=3A_Program_d?=
 =?utf-8?q?ouble_buffered_LUT_registers_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 08 Apr 2025 22:55:09 -0000
Message-ID: <174415290924.50261.5652350850612250019@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250408110022.1907802-1-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20250408110022.1907802-1-chaitanya.kumar.borah@intel.com>
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

--===============2150585042713864814==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/display: Program double buffered LUT registers (rev7)
URL   : https://patchwork.freedesktop.org/series/142436/
State : success

== Summary ==

CI Bug Log - changes from xe-2920-1951437999630d299a063863fb92d235dd8dc3d1_BAT -> xe-pw-142436v7_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): bat-adlp-vm 

Known issues
------------

  Here are the changes found in xe-pw-142436v7_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_evict@evict-beng-small-cm:
    - bat-adlp-vf:        NOTRUN -> [SKIP][1] ([Intel XE#261] / [Intel XE#688]) +9 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142436v7/bat-adlp-vf/igt@xe_evict@evict-beng-small-cm.html

  * igt@xe_exec_fault_mode@twice-rebind:
    - bat-adlp-vf:        NOTRUN -> [SKIP][2] ([Intel XE#288]) +32 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142436v7/bat-adlp-vf/igt@xe_exec_fault_mode@twice-rebind.html

  * igt@xe_gt_freq@freq_fixed_idle:
    - bat-adlp-vf:        NOTRUN -> [SKIP][3] ([Intel XE#2464]) +2 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142436v7/bat-adlp-vf/igt@xe_gt_freq@freq_fixed_idle.html

  * igt@xe_live_ktest@xe_bo:
    - bat-adlp-vf:        NOTRUN -> [SKIP][4] ([Intel XE#2229] / [Intel XE#455]) +2 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142436v7/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - bat-adlp-vf:        NOTRUN -> [SKIP][5] ([Intel XE#2229])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142436v7/bat-adlp-vf/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_mmap@vram:
    - bat-adlp-vf:        NOTRUN -> [SKIP][6] ([Intel XE#1008])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142436v7/bat-adlp-vf/igt@xe_mmap@vram.html

  * igt@xe_pat@pat-index-xe2:
    - bat-adlp-vf:        NOTRUN -> [SKIP][7] ([Intel XE#977])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142436v7/bat-adlp-vf/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-adlp-vf:        NOTRUN -> [SKIP][8] ([Intel XE#2838] / [Intel XE#979])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142436v7/bat-adlp-vf/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelpg:
    - bat-adlp-vf:        NOTRUN -> [SKIP][9] ([Intel XE#979])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142436v7/bat-adlp-vf/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm_residency@gt-c6-on-idle:
    - bat-adlp-vf:        NOTRUN -> [SKIP][10] ([Intel XE#2468])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142436v7/bat-adlp-vf/igt@xe_pm_residency@gt-c6-on-idle.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - bat-adlp-vf:        NOTRUN -> [SKIP][11] ([Intel XE#3342])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142436v7/bat-adlp-vf/igt@xe_sriov_flr@flr-vf1-clear.html

  
#### Possible fixes ####

  * igt@xe_exec_basic@twice-bindexecqueue-rebind:
    - bat-adlp-vf:        [ABORT][12] ([Intel XE#3970]) -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2920-1951437999630d299a063863fb92d235dd8dc3d1/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-rebind.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142436v7/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-rebind.html

  
  [Intel XE#1008]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2464]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2464
  [Intel XE#2468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2468
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * Linux: xe-2920-1951437999630d299a063863fb92d235dd8dc3d1 -> xe-pw-142436v7

  IGT_8311: 851a9c1cb1a690d8c527f26c49c250ec583af65e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2920-1951437999630d299a063863fb92d235dd8dc3d1: 1951437999630d299a063863fb92d235dd8dc3d1
  xe-pw-142436v7: 142436v7

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142436v7/index.html

--===============2150585042713864814==
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
<tr><td><b>Series:</b></td><td>drm/xe/display: Program double buffered LUT registers (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/142436/">https://patchwork.freedesktop.org/series/142436/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142436v7/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142436v7/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2920-1951437999630d299a063863fb92d235dd8dc3d1_BAT -&gt; xe-pw-142436v7_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-142436v7_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_evict@evict-beng-small-cm:</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142436v7/bat-adlp-vf/igt@xe_evict@evict-beng-small-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-rebind:</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142436v7/bat-adlp-vf/igt@xe_exec_fault_mode@twice-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_fixed_idle:</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142436v7/bat-adlp-vf/igt@xe_gt_freq@freq_fixed_idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2464">Intel XE#2464</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142436v7/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142436v7/bat-adlp-vf/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142436v7/bat-adlp-vf/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008">Intel XE#1008</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142436v7/bat-adlp-vf/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142436v7/bat-adlp-vf/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142436v7/bat-adlp-vf/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-on-idle:</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142436v7/bat-adlp-vf/igt@xe_pm_residency@gt-c6-on-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2468">Intel XE#2468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142436v7/bat-adlp-vf/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_exec_basic@twice-bindexecqueue-rebind:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2920-1951437999630d299a063863fb92d235dd8dc3d1/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142436v7/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-rebind.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2920-1951437999630d299a063863fb92d235dd8dc3d1 -&gt; xe-pw-142436v7</li>
</ul>
<p>IGT_8311: 851a9c1cb1a690d8c527f26c49c250ec583af65e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2920-1951437999630d299a063863fb92d235dd8dc3d1: 1951437999630d299a063863fb92d235dd8dc3d1<br />
  xe-pw-142436v7: 142436v7</p>

</body>
</html>

--===============2150585042713864814==--
