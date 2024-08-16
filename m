Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E17EC3DA4A
	for <intel-xe@archiver.kernel.org>; Fri, 16 Aug 2024 07:52:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E495D10E5C4;
	Fri, 16 Aug 2024 07:52:04 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE17C10E5C4;
 Fri, 16 Aug 2024 07:52:03 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5950800415216264534=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_drm/xe=3A_Remove_NULL_check_of_l?=
 =?utf-8?q?rc-=3Ebo_in_xe=5Flrc=5Fsnapshot=5Fcapture=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Singh, Apoorva" <apoorva.singh@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 16 Aug 2024 07:52:03 -0000
Message-ID: <172379472376.652113.5861107968330516730@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240816062446.896829-1-apoorva.singh@intel.com>
In-Reply-To: <20240816062446.896829-1-apoorva.singh@intel.com>
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

--===============5950800415216264534==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Remove NULL check of lrc->bo in xe_lrc_snapshot_capture()
URL   : https://patchwork.freedesktop.org/series/137367/
State : failure

== Summary ==

CI Bug Log - changes from xe-1779-6f1b8ad3db6e51875e1ecd31c9ca14b4ccb4ec5a_BAT -> xe-pw-137367v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-137367v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-137367v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-137367v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:
    - bat-bmg-1:          [PASS][1] -> [SKIP][2] +12 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1779-6f1b8ad3db6e51875e1ecd31c9ca14b4ccb4ec5a/bat-bmg-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137367v1/bat-bmg-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html

  
#### Warnings ####

  * igt@kms_dsc@dsc-basic:
    - bat-bmg-1:          [SKIP][3] ([Intel XE#2244]) -> [SKIP][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1779-6f1b8ad3db6e51875e1ecd31c9ca14b4ccb4ec5a/bat-bmg-1/igt@kms_dsc@dsc-basic.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137367v1/bat-bmg-1/igt@kms_dsc@dsc-basic.html

  
Known issues
------------

  Here are the changes found in xe-pw-137367v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@write:
    - bat-bmg-1:          [PASS][5] -> [SKIP][6] ([Intel XE#2134]) +4 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1779-6f1b8ad3db6e51875e1ecd31c9ca14b4ccb4ec5a/bat-bmg-1/igt@fbdev@write.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137367v1/bat-bmg-1/igt@fbdev@write.html

  * igt@kms_flip@basic-plain-flip:
    - bat-bmg-1:          [PASS][7] -> [SKIP][8] ([Intel XE#2482]) +3 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1779-6f1b8ad3db6e51875e1ecd31c9ca14b4ccb4ec5a/bat-bmg-1/igt@kms_flip@basic-plain-flip.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137367v1/bat-bmg-1/igt@kms_flip@basic-plain-flip.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-bmg-1:          [PASS][9] -> [SKIP][10] ([Intel XE#2434])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1779-6f1b8ad3db6e51875e1ecd31c9ca14b4ccb4ec5a/bat-bmg-1/igt@kms_frontbuffer_tracking@basic.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137367v1/bat-bmg-1/igt@kms_frontbuffer_tracking@basic.html

  
#### Possible fixes ####

  * igt@xe_vm@munmap-style-unbind-userptr-inval-end:
    - bat-adlp-vf:        [FAIL][11] ([Intel XE#2546]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1779-6f1b8ad3db6e51875e1ecd31c9ca14b4ccb4ec5a/bat-adlp-vf/igt@xe_vm@munmap-style-unbind-userptr-inval-end.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137367v1/bat-adlp-vf/igt@xe_vm@munmap-style-unbind-userptr-inval-end.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2434]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2434
  [Intel XE#2482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482
  [Intel XE#2546]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2546
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877


Build changes
-------------

  * Linux: xe-1779-6f1b8ad3db6e51875e1ecd31c9ca14b4ccb4ec5a -> xe-pw-137367v1

  IGT_7972: c34e13f766d0ed48c8b62ad9d8c29f11a8441b8b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1779-6f1b8ad3db6e51875e1ecd31c9ca14b4ccb4ec5a: 6f1b8ad3db6e51875e1ecd31c9ca14b4ccb4ec5a
  xe-pw-137367v1: 137367v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137367v1/index.html

--===============5950800415216264534==
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
<tr><td><b>Series:</b></td><td>drm/xe: Remove NULL check of lrc-&gt;bo in xe_lrc_snapshot_capture()</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137367/">https://patchwork.freedesktop.org/series/137367/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137367v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137367v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1779-6f1b8ad3db6e51875e1ecd31c9ca14b4ccb4ec5a_BAT -&gt; xe-pw-137367v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-137367v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-137367v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-137367v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1779-6f1b8ad3db6e51875e1ecd31c9ca14b4ccb4ec5a/bat-bmg-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137367v1/bat-bmg-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html">SKIP</a> +12 other tests skip</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_dsc@dsc-basic:<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1779-6f1b8ad3db6e51875e1ecd31c9ca14b4ccb4ec5a/bat-bmg-1/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137367v1/bat-bmg-1/igt@kms_dsc@dsc-basic.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-137367v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1779-6f1b8ad3db6e51875e1ecd31c9ca14b4ccb4ec5a/bat-bmg-1/igt@fbdev@write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137367v1/bat-bmg-1/igt@fbdev@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1779-6f1b8ad3db6e51875e1ecd31c9ca14b4ccb4ec5a/bat-bmg-1/igt@kms_flip@basic-plain-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137367v1/bat-bmg-1/igt@kms_flip@basic-plain-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482">Intel XE#2482</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1779-6f1b8ad3db6e51875e1ecd31c9ca14b4ccb4ec5a/bat-bmg-1/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137367v1/bat-bmg-1/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2434">Intel XE#2434</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_vm@munmap-style-unbind-userptr-inval-end:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1779-6f1b8ad3db6e51875e1ecd31c9ca14b4ccb4ec5a/bat-adlp-vf/igt@xe_vm@munmap-style-unbind-userptr-inval-end.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2546">Intel XE#2546</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137367v1/bat-adlp-vf/igt@xe_vm@munmap-style-unbind-userptr-inval-end.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1779-6f1b8ad3db6e51875e1ecd31c9ca14b4ccb4ec5a -&gt; xe-pw-137367v1</li>
</ul>
<p>IGT_7972: c34e13f766d0ed48c8b62ad9d8c29f11a8441b8b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1779-6f1b8ad3db6e51875e1ecd31c9ca14b4ccb4ec5a: 6f1b8ad3db6e51875e1ecd31c9ca14b4ccb4ec5a<br />
  xe-pw-137367v1: 137367v1</p>

</body>
</html>

--===============5950800415216264534==--
