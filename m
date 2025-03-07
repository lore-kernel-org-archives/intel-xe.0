Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E7F8C28B2E
	for <intel-xe@archiver.kernel.org>; Fri,  7 Mar 2025 21:44:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F310610E1C8;
	Fri,  7 Mar 2025 21:44:45 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6489B10E1C8;
 Fri,  7 Mar 2025 21:44:44 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1332044779472193908=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_Improve_SRIOV_VRAM_provisio?=
 =?utf-8?q?ning_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 07 Mar 2025 21:44:44 -0000
Message-ID: <174138388440.4463.10604468620101706408@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250307182856.304850-10-matthew.auld@intel.com>
In-Reply-To: <20250307182856.304850-10-matthew.auld@intel.com>
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

--===============1332044779472193908==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Improve SRIOV VRAM provisioning (rev2)
URL   : https://patchwork.freedesktop.org/series/142782/
State : failure

== Summary ==

CI Bug Log - changes from xe-2778-f811577f424491a57b1e8669bde62998227d6907_BAT -> xe-pw-142782v2_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-142782v2_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-142782v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (10 -> 9)
------------------------------

  Missing    (1): bat-adlp-vm 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-142782v2_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_live_ktest@xe_bo:
    - bat-pvc-2:          [PASS][1] -> [ABORT][2] +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/bat-pvc-2/igt@xe_live_ktest@xe_bo.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v2/bat-pvc-2/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - bat-bmg-2:          [PASS][3] -> [ABORT][4] +1 other test abort
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v2/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
    - bat-bmg-1:          [PASS][5] -> [ABORT][6] +1 other test abort
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/bat-bmg-1/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v2/bat-bmg-1/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
    - bat-dg2-oem2:       [PASS][7] -> [ABORT][8] +1 other test abort
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v2/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
    - bat-atsm-2:         [PASS][9] -> [ABORT][10] +1 other test abort
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/bat-atsm-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v2/bat-atsm-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - bat-lnl-1:          [PASS][11] -> [ABORT][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/bat-lnl-1/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v2/bat-lnl-1/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
    - bat-lnl-2:          [PASS][13] -> [ABORT][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/bat-lnl-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v2/bat-lnl-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  
#### Warnings ####

  * igt@xe_live_ktest@xe_bo:
    - bat-lnl-1:          [SKIP][15] ([Intel XE#2229]) -> [ABORT][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/bat-lnl-1/igt@xe_live_ktest@xe_bo.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v2/bat-lnl-1/igt@xe_live_ktest@xe_bo.html
    - bat-lnl-2:          [SKIP][17] ([Intel XE#2229]) -> [ABORT][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/bat-lnl-2/igt@xe_live_ktest@xe_bo.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v2/bat-lnl-2/igt@xe_live_ktest@xe_bo.html

  
Known issues
------------

  Here are the changes found in xe-pw-142782v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_intel_bb@intel-bb-blit-x:
    - bat-adlp-vf:        [PASS][19] -> [ABORT][20] ([Intel XE#4491])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/bat-adlp-vf/igt@xe_intel_bb@intel-bb-blit-x.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v2/bat-adlp-vf/igt@xe_intel_bb@intel-bb-blit-x.html

  
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#4491]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4491


Build changes
-------------

  * Linux: xe-2778-f811577f424491a57b1e8669bde62998227d6907 -> xe-pw-142782v2

  IGT_8264: 8264
  xe-2778-f811577f424491a57b1e8669bde62998227d6907: f811577f424491a57b1e8669bde62998227d6907
  xe-pw-142782v2: 142782v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v2/index.html

--===============1332044779472193908==
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
<tr><td><b>Series:</b></td><td>Improve SRIOV VRAM provisioning (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/142782/">https://patchwork.freedesktop.org/series/142782/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2778-f811577f424491a57b1e8669bde62998227d6907_BAT -&gt; xe-pw-142782v2_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-142782v2_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-142782v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (10 -&gt; 9)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-142782v2_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/bat-pvc-2/igt@xe_live_ktest@xe_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v2/bat-pvc-2/igt@xe_live_ktest@xe_bo.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v2/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">ABORT</a> +1 other test abort</li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/bat-bmg-1/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v2/bat-bmg-1/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">ABORT</a> +1 other test abort</li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v2/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">ABORT</a> +1 other test abort</li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/bat-atsm-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v2/bat-atsm-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/bat-lnl-1/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v2/bat-lnl-1/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">ABORT</a></li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/bat-lnl-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v2/bat-lnl-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">ABORT</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_live_ktest@xe_bo:<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/bat-lnl-1/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v2/bat-lnl-1/igt@xe_live_ktest@xe_bo.html">ABORT</a></li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/bat-lnl-2/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v2/bat-lnl-2/igt@xe_live_ktest@xe_bo.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-142782v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_intel_bb@intel-bb-blit-x:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2778-f811577f424491a57b1e8669bde62998227d6907/bat-adlp-vf/igt@xe_intel_bb@intel-bb-blit-x.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142782v2/bat-adlp-vf/igt@xe_intel_bb@intel-bb-blit-x.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4491">Intel XE#4491</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2778-f811577f424491a57b1e8669bde62998227d6907 -&gt; xe-pw-142782v2</li>
</ul>
<p>IGT_8264: 8264<br />
  xe-2778-f811577f424491a57b1e8669bde62998227d6907: f811577f424491a57b1e8669bde62998227d6907<br />
  xe-pw-142782v2: 142782v2</p>

</body>
</html>

--===============1332044779472193908==--
