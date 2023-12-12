Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 322A7C4332F
	for <intel-xe@archiver.kernel.org>; Tue, 12 Dec 2023 05:16:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E007310E16D;
	Tue, 12 Dec 2023 05:16:29 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1753610E16D;
 Tue, 12 Dec 2023 05:16:28 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 101F4AADDD;
 Tue, 12 Dec 2023 05:16:28 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8344961235673203937=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_series_starting_with_=5B1/2=5D_f?=
 =?utf-8?q?ixup!_fixup!_drm/xe=3A_Introduce_a_new_DRM_driver_for_Intel_GPUs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Date: Tue, 12 Dec 2023 05:16:28 -0000
Message-ID: <170235818805.31292.15956343083291794559@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231212031907.1120896-1-rodrigo.vivi@intel.com>
In-Reply-To: <20231212031907.1120896-1-rodrigo.vivi@intel.com>
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

--===============8344961235673203937==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/2] fixup! fixup! drm/xe: Introduce a new DRM driver for Intel GPUs
URL   : https://patchwork.freedesktop.org/series/127661/
State : success

== Summary ==

CI Bug Log - changes from xe-569-5cae0d34637bd4914e4099eff1233d83bc9d2d21_BAT -> xe-pw-127661v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-127661v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:
    - bat-adlp-7:         [PASS][1] -> [FAIL][2] ([Intel XE#692])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-569-5cae0d34637bd4914e4099eff1233d83bc9d2d21/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127661v1/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:
    - bat-adlp-7:         [PASS][3] -> [FAIL][4] ([Intel XE#480]) +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-569-5cae0d34637bd4914e4099eff1233d83bc9d2d21/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127661v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html

  
#### Possible fixes ####

  * igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:
    - bat-adlp-7:         [FAIL][5] ([i915#2346]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-569-5cae0d34637bd4914e4099eff1233d83bc9d2d21/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127661v1/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [DMESG-FAIL][7] ([Intel XE#282] / [i915#2017]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-569-5cae0d34637bd4914e4099eff1233d83bc9d2d21/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127661v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  
  [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#692]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/692
  [i915#2017]: https://gitlab.freedesktop.org/drm/intel/issues/2017
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346


Build changes
-------------

  * Linux: xe-569-5cae0d34637bd4914e4099eff1233d83bc9d2d21 -> xe-pw-127661v1

  IGT_7635: 0b796be8ce05cb2070ce5136d248f438c962d11e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-569-5cae0d34637bd4914e4099eff1233d83bc9d2d21: 5cae0d34637bd4914e4099eff1233d83bc9d2d21
  xe-pw-127661v1: 127661v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127661v1/index.html

--===============8344961235673203937==
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
<tr><td><b>Series:</b></td><td>series starting with [1/2] fixup! fixup! drm/xe: Introduce a new DRM driver for Intel GPUs</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/127661/">https://patchwork.freedesktop.org/series/127661/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127661v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127661v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-569-5cae0d34637bd4914e4099eff1233d83bc9d2d21_BAT -&gt; xe-pw-127661v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-127661v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-569-5cae0d34637bd4914e4099eff1233d83bc9d2d21/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127661v1/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/692">Intel XE#692</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-569-5cae0d34637bd4914e4099eff1233d83bc9d2d21/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127661v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) +1 other test fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-569-5cae0d34637bd4914e4099eff1233d83bc9d2d21/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127661v1/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-569-5cae0d34637bd4914e4099eff1233d83bc9d2d21/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2017">i915#2017</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127661v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-569-5cae0d34637bd4914e4099eff1233d83bc9d2d21 -&gt; xe-pw-127661v1</li>
</ul>
<p>IGT_7635: 0b796be8ce05cb2070ce5136d248f438c962d11e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-569-5cae0d34637bd4914e4099eff1233d83bc9d2d21: 5cae0d34637bd4914e4099eff1233d83bc9d2d21<br />
  xe-pw-127661v1: 127661v1</p>

</body>
</html>

--===============8344961235673203937==--
