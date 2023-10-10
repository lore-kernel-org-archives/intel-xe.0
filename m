Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0C0ECD80A3
	for <intel-xe@archiver.kernel.org>; Tue, 10 Oct 2023 10:46:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A073B10E1D0;
	Tue, 10 Oct 2023 10:46:25 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2419910E1D0;
 Tue, 10 Oct 2023 10:46:24 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 1B789AADF2;
 Tue, 10 Oct 2023 10:46:24 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0460899377910493447=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Date: Tue, 10 Oct 2023 10:46:24 -0000
Message-ID: <169693478407.28098.6977329851332021005@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231010094031.7-1-francois.dugast@intel.com>
In-Reply-To: <20231010094031.7-1-francois.dugast@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_drm/xe/hw?=
 =?utf-8?q?=5Fengine=3A_Document_difference_between_instance_and_logical_i?=
 =?utf-8?q?nstance_=28rev2=29?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

--===============0460899377910493447==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/hw_engine: Document difference between instance and logical instance (rev2)
URL   : https://patchwork.freedesktop.org/series/124653/
State : failure

== Summary ==

CI Bug Log - changes from xe-423-37b2d042c23ae6a10055ea92101a15083d64c718_BAT -> xe-pw-124653v2_BAT
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with xe-pw-124653v2_BAT need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-124653v2_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-124653v2_BAT:

### IGT changes ###

#### Warnings ####

  * igt@kms_psr@cursor_plane_move:
    - bat-atsm-2:         [SKIP][1] ([i915#1072]) -> [SKIP][2] +2 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-423-37b2d042c23ae6a10055ea92101a15083d64c718/bat-atsm-2/igt@kms_psr@cursor_plane_move.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124653v2/bat-atsm-2/igt@kms_psr@cursor_plane_move.html

  * igt@kms_psr@primary_page_flip:
    - bat-dg2-oem2:       [SKIP][3] ([i915#1072]) -> [SKIP][4] +2 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-423-37b2d042c23ae6a10055ea92101a15083d64c718/bat-dg2-oem2/igt@kms_psr@primary_page_flip.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124653v2/bat-dg2-oem2/igt@kms_psr@primary_page_flip.html

  
Known issues
------------

  Here are the changes found in xe-pw-124653v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-adlp-7:         [PASS][5] -> [FAIL][6] ([Intel XE#480]) +1 other test fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-423-37b2d042c23ae6a10055ea92101a15083d64c718/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124653v2/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html

  
#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3:
    - bat-dg2-oem2:       [FAIL][7] ([Intel XE#480]) -> [PASS][8] +1 other test pass
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-423-37b2d042c23ae6a10055ea92101a15083d64c718/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124653v2/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3.html

  * {igt@xe_create@create-execqueues-noleak}:
    - bat-adlp-7:         [FAIL][9] ([Intel XE#524]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-423-37b2d042c23ae6a10055ea92101a15083d64c718/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124653v2/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html
    - bat-atsm-2:         [FAIL][11] ([Intel XE#524]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-423-37b2d042c23ae6a10055ea92101a15083d64c718/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124653v2/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html

  * igt@xe_exec_threads@threads-basic:
    - bat-pvc-2:          [DMESG-WARN][13] ([Intel XE#696]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-423-37b2d042c23ae6a10055ea92101a15083d64c718/bat-pvc-2/igt@xe_exec_threads@threads-basic.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124653v2/bat-pvc-2/igt@xe_exec_threads@threads-basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524
  [Intel XE#696]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/696
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072


Build changes
-------------

  * IGT: IGT_7522 -> IGT_7523
  * Linux: xe-423-37b2d042c23ae6a10055ea92101a15083d64c718 -> xe-pw-124653v2

  IGT_7522: 334a1178a36a1327dc7fbba43ab16d1f3a7d887b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7523: 361c2f92f1fe5641090f2fc59951fcaba15387f5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-423-37b2d042c23ae6a10055ea92101a15083d64c718: 37b2d042c23ae6a10055ea92101a15083d64c718
  xe-pw-124653v2: 124653v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124653v2/index.html

--===============0460899377910493447==
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
<tr><td><b>Series:</b></td><td>drm/xe/hw_engine: Document difference between instance and logical instance (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/124653/">https://patchwork.freedesktop.org/series/124653/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124653v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124653v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-423-37b2d042c23ae6a10055ea92101a15083d64c718_BAT -&gt; xe-pw-124653v2_BAT</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with xe-pw-124653v2_BAT need to be verified<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-124653v2_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-124653v2_BAT:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_psr@cursor_plane_move:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-423-37b2d042c23ae6a10055ea92101a15083d64c718/bat-atsm-2/igt@kms_psr@cursor_plane_move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124653v2/bat-atsm-2/igt@kms_psr@cursor_plane_move.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_page_flip:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-423-37b2d042c23ae6a10055ea92101a15083d64c718/bat-dg2-oem2/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124653v2/bat-dg2-oem2/igt@kms_psr@primary_page_flip.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-124653v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-423-37b2d042c23ae6a10055ea92101a15083d64c718/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124653v2/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) +1 other test fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-423-37b2d042c23ae6a10055ea92101a15083d64c718/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124653v2/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>{igt@xe_create@create-execqueues-noleak}:</p>
<ul>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-423-37b2d042c23ae6a10055ea92101a15083d64c718/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/524">Intel XE#524</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124653v2/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html">PASS</a></p>
</li>
<li>
<p>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-423-37b2d042c23ae6a10055ea92101a15083d64c718/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/524">Intel XE#524</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124653v2/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-basic:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-423-37b2d042c23ae6a10055ea92101a15083d64c718/bat-pvc-2/igt@xe_exec_threads@threads-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/696">Intel XE#696</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124653v2/bat-pvc-2/igt@xe_exec_threads@threads-basic.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7522 -&gt; IGT_7523</li>
<li>Linux: xe-423-37b2d042c23ae6a10055ea92101a15083d64c718 -&gt; xe-pw-124653v2</li>
</ul>
<p>IGT_7522: 334a1178a36a1327dc7fbba43ab16d1f3a7d887b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7523: 361c2f92f1fe5641090f2fc59951fcaba15387f5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-423-37b2d042c23ae6a10055ea92101a15083d64c718: 37b2d042c23ae6a10055ea92101a15083d64c718<br />
  xe-pw-124653v2: 124653v2</p>

</body>
</html>

--===============0460899377910493447==--
