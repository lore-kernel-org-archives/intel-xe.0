Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D950CCD1BF
	for <intel-xe@archiver.kernel.org>; Fri, 24 Oct 2025 20:05:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 241EB10EB36;
	Fri, 24 Oct 2025 20:05:07 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01CA710EB3E;
 Fri, 24 Oct 2025 20:05:06 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8041598430595433786=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/xe/uc=3A_Change_asserti?=
 =?utf-8?q?on_to_error_on_huc_authentication_failure_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Zhanjun Dong" <zhanjun.dong@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 24 Oct 2025 20:05:05 -0000
Message-ID: <176133630599.54054.16231934640774677532@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251024191959.2555145-1-zhanjun.dong@intel.com>
In-Reply-To: <20251024191959.2555145-1-zhanjun.dong@intel.com>
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

--===============8041598430595433786==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/uc: Change assertion to error on huc authentication failure (rev2)
URL   : https://patchwork.freedesktop.org/series/156439/
State : failure

== Summary ==

CI Bug Log - changes from xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e_BAT -> xe-pw-156439v2_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-156439v2_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-156439v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-156439v2_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-lnl-2:          [PASS][1] -> [DMESG-WARN][2] +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/bat-lnl-2/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156439v2/bat-lnl-2/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1:
    - bat-adlp-7:         [PASS][3] -> [DMESG-WARN][4] +6 other tests dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/bat-adlp-7/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156439v2/bat-adlp-7/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1.html

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-edp-1:
    - bat-lnl-1:          [PASS][5] -> [DMESG-WARN][6] +5 other tests dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/bat-lnl-1/igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-edp-1.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156439v2/bat-lnl-1/igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-edp-1.html

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-edp-1:
    - bat-ptl-2:          [PASS][7] -> [DMESG-WARN][8] +6 other tests dmesg-warn
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/bat-ptl-2/igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-edp-1.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156439v2/bat-ptl-2/igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-edp-1.html

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-hdmi-a-3:
    - bat-bmg-1:          [PASS][9] -> [DMESG-WARN][10] +8 other tests dmesg-warn
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/bat-bmg-1/igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-hdmi-a-3.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156439v2/bat-bmg-1/igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-hdmi-a-3.html

  * igt@xe_live_ktest@xe_bo:
    - bat-pvc-2:          [PASS][11] -> [DMESG-WARN][12] +3 other tests dmesg-warn
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/bat-pvc-2/igt@xe_live_ktest@xe_bo.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156439v2/bat-pvc-2/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - bat-bmg-2:          [PASS][13] -> [DMESG-WARN][14] +3 other tests dmesg-warn
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156439v2/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  * igt@xe_module_load@load:
    - bat-dg2-oem2:       [PASS][15] -> [DMESG-WARN][16] +8 other tests dmesg-warn
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/bat-dg2-oem2/igt@xe_module_load@load.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156439v2/bat-dg2-oem2/igt@xe_module_load@load.html
    - bat-atsm-2:         [PASS][17] -> [DMESG-WARN][18] +4 other tests dmesg-warn
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/bat-atsm-2/igt@xe_module_load@load.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156439v2/bat-atsm-2/igt@xe_module_load@load.html
    - bat-ptl-1:          [PASS][19] -> [DMESG-WARN][20] +1 other test dmesg-warn
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/bat-ptl-1/igt@xe_module_load@load.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156439v2/bat-ptl-1/igt@xe_module_load@load.html

  
Known issues
------------

  Here are the changes found in xe-pw-156439v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-plain-flip@a-edp1:
    - bat-adlp-7:         [PASS][21] -> [DMESG-WARN][22] ([Intel XE#4543]) +1 other test dmesg-warn
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/bat-adlp-7/igt@kms_flip@basic-plain-flip@a-edp1.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156439v2/bat-adlp-7/igt@kms_flip@basic-plain-flip@a-edp1.html

  
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543


Build changes
-------------

  * Linux: xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e -> xe-pw-156439v2

  IGT_8596: 8596
  xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e: dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e
  xe-pw-156439v2: 156439v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156439v2/index.html

--===============8041598430595433786==
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
<tr><td><b>Series:</b></td><td>drm/xe/uc: Change assertion to error on huc authentication failure (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/156439/">https://patchwork.freedesktop.org/series/156439/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156439v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156439v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e_BAT -&gt; xe-pw-156439v2_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-156439v2_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-156439v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-156439v2_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/bat-lnl-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156439v2/bat-lnl-2/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/bat-adlp-7/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156439v2/bat-adlp-7/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-edp-1.html">DMESG-WARN</a> +6 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-edp-1:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/bat-lnl-1/igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156439v2/bat-lnl-1/igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-edp-1.html">DMESG-WARN</a> +5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-edp-1:</p>
<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/bat-ptl-2/igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156439v2/bat-ptl-2/igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-edp-1.html">DMESG-WARN</a> +6 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-hdmi-a-3:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/bat-bmg-1/igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-hdmi-a-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156439v2/bat-bmg-1/igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-hdmi-a-3.html">DMESG-WARN</a> +8 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/bat-pvc-2/igt@xe_live_ktest@xe_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156439v2/bat-pvc-2/igt@xe_live_ktest@xe_bo.html">DMESG-WARN</a> +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156439v2/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">DMESG-WARN</a> +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/bat-dg2-oem2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156439v2/bat-dg2-oem2/igt@xe_module_load@load.html">DMESG-WARN</a> +8 other tests dmesg-warn</li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/bat-atsm-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156439v2/bat-atsm-2/igt@xe_module_load@load.html">DMESG-WARN</a> +4 other tests dmesg-warn</li>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/bat-ptl-1/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156439v2/bat-ptl-1/igt@xe_module_load@load.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-156439v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_flip@basic-plain-flip@a-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e/bat-adlp-7/igt@kms_flip@basic-plain-flip@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156439v2/bat-adlp-7/igt@kms_flip@basic-plain-flip@a-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e -&gt; xe-pw-156439v2</li>
</ul>
<p>IGT_8596: 8596<br />
  xe-3983-dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e: dc9103f4ebd013ec0aa7b2d493370ec6fb1b234e<br />
  xe-pw-156439v2: 156439v2</p>

</body>
</html>

--===============8041598430595433786==--
