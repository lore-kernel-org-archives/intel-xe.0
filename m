Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6373DCF34A9
	for <intel-xe@archiver.kernel.org>; Thu,  3 Oct 2024 13:06:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B286B10E120;
	Thu,  3 Oct 2024 13:06:50 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32C8710E078;
 Thu,  3 Oct 2024 13:06:50 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0605513829234877251=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_Revert_=22platform/x86=3Aintel/p?=
 =?utf-8?q?mc=3A_Enable_the_ACPI_PM_Timer_to_be_turned_off_when_suspended=22?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Luca Coelho" <luciano.coelho@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 03 Oct 2024 13:06:50 -0000
Message-ID: <172796081019.1168339.81254558321125069@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241003122047.1278471-1-luciano.coelho@intel.com>
In-Reply-To: <20241003122047.1278471-1-luciano.coelho@intel.com>
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

--===============0605513829234877251==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Revert "platform/x86:intel/pmc: Enable the ACPI PM Timer to be turned off when suspended"
URL   : https://patchwork.freedesktop.org/series/139499/
State : success

== Summary ==

CI Bug Log - changes from xe-2010-af143300756485947a455fe84414adb35904c230_BAT -> xe-pw-139499v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): bat-lnl-2 

Known issues
------------

  Here are the changes found in xe-pw-139499v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_evict@evict-beng-small:
    - bat-adlp-7:         NOTRUN -> [SKIP][1] ([Intel XE#261] / [Intel XE#688]) +15 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139499v1/bat-adlp-7/igt@xe_evict@evict-beng-small.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:
    - bat-adlp-7:         NOTRUN -> [SKIP][2] ([Intel XE#288]) +32 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139499v1/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - bat-adlp-7:         NOTRUN -> [SKIP][3] ([Intel XE#2229])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139499v1/bat-adlp-7/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  
#### Possible fixes ####

  * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
    - bat-adlp-7:         [INCOMPLETE][4] ([Intel XE#2874]) -> [PASS][5] +1 other test pass
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2010-af143300756485947a455fe84414adb35904c230/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139499v1/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html

  
#### Warnings ####

  * igt@kms_hdmi_inject@inject-audio:
    - bat-lnl-1:          [SKIP][6] ([Intel XE#2853]) -> [SKIP][7] ([Intel XE#1470] / [Intel XE#2853])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2010-af143300756485947a455fe84414adb35904c230/bat-lnl-1/igt@kms_hdmi_inject@inject-audio.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139499v1/bat-lnl-1/igt@kms_hdmi_inject@inject-audio.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-lnl-1:          [SKIP][8] ([Intel XE#2838]) -> [SKIP][9] ([Intel XE#1420] / [Intel XE#2838])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2010-af143300756485947a455fe84414adb35904c230/bat-lnl-1/igt@xe_pat@pat-index-xehpc.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139499v1/bat-lnl-1/igt@xe_pat@pat-index-xehpc.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2853]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2853
  [Intel XE#2874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688


Build changes
-------------

  * IGT: IGT_8050 -> IGT_8051
  * Linux: xe-2010-af143300756485947a455fe84414adb35904c230 -> xe-pw-139499v1

  IGT_8050: 0000bc070385689633718cbab01ab02a524f2c61 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8051: c2efcb5f207eebb0c19106f27b310f61ded6f11d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2010-af143300756485947a455fe84414adb35904c230: af143300756485947a455fe84414adb35904c230
  xe-pw-139499v1: 139499v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139499v1/index.html

--===============0605513829234877251==
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
<tr><td><b>Series:</b></td><td>Revert &quot;platform/x86:intel/pmc: Enable the ACPI PM Timer to be turned off when suspended&quot;</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/139499/">https://patchwork.freedesktop.org/series/139499/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139499v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139499v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2010-af143300756485947a455fe84414adb35904c230_BAT -&gt; xe-pw-139499v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-lnl-2 </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-139499v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_evict@evict-beng-small:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139499v1/bat-adlp-7/igt@xe_evict@evict-beng-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139499v1/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139499v1/bat-adlp-7/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2010-af143300756485947a455fe84414adb35904c230/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874">Intel XE#2874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139499v1/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2010-af143300756485947a455fe84414adb35904c230/bat-lnl-1/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2853">Intel XE#2853</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139499v1/bat-lnl-1/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470">Intel XE#1470</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2853">Intel XE#2853</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2010-af143300756485947a455fe84414adb35904c230/bat-lnl-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139499v1/bat-lnl-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8050 -&gt; IGT_8051</li>
<li>Linux: xe-2010-af143300756485947a455fe84414adb35904c230 -&gt; xe-pw-139499v1</li>
</ul>
<p>IGT_8050: 0000bc070385689633718cbab01ab02a524f2c61 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8051: c2efcb5f207eebb0c19106f27b310f61ded6f11d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2010-af143300756485947a455fe84414adb35904c230: af143300756485947a455fe84414adb35904c230<br />
  xe-pw-139499v1: 139499v1</p>

</body>
</html>

--===============0605513829234877251==--
