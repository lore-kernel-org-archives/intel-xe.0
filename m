Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9950CED240
	for <intel-xe@archiver.kernel.org>; Tue, 18 Nov 2025 05:06:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64E4210E1EA;
	Tue, 18 Nov 2025 05:06:34 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E50AF10E0C3;
 Tue, 18 Nov 2025 05:06:33 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3686551911298765617=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/xe=3A_Allow_compressibl?=
 =?utf-8?q?e_surfaces_to_be_1-way_coherent_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Xin Wang" <x.wang@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 18 Nov 2025 05:06:33 -0000
Message-ID: <176344239393.3615.28906930092428475@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251118042048.597801-1-x.wang@intel.com>
In-Reply-To: <20251118042048.597801-1-x.wang@intel.com>
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

--===============3686551911298765617==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Allow compressible surfaces to be 1-way coherent (rev2)
URL   : https://patchwork.freedesktop.org/series/157036/
State : failure

== Summary ==

CI Bug Log - changes from xe-4121-91fc6d984707c9bfd4a60550e6a85f1a991e7ec8_BAT -> xe-pw-157036v2_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-157036v2_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-157036v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-157036v2_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_pat@pat-index-all:
    - bat-ptl-1:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4121-91fc6d984707c9bfd4a60550e6a85f1a991e7ec8/bat-ptl-1/igt@xe_pat@pat-index-all.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157036v2/bat-ptl-1/igt@xe_pat@pat-index-all.html
    - bat-ptl-vm:         [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4121-91fc6d984707c9bfd4a60550e6a85f1a991e7ec8/bat-ptl-vm/igt@xe_pat@pat-index-all.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157036v2/bat-ptl-vm/igt@xe_pat@pat-index-all.html
    - bat-ptl-2:          [PASS][5] -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4121-91fc6d984707c9bfd4a60550e6a85f1a991e7ec8/bat-ptl-2/igt@xe_pat@pat-index-all.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157036v2/bat-ptl-2/igt@xe_pat@pat-index-all.html

  
Known issues
------------

  Here are the changes found in xe-pw-157036v2_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_waitfence@abstime:
    - bat-dg2-oem2:       [TIMEOUT][7] ([Intel XE#6506]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4121-91fc6d984707c9bfd4a60550e6a85f1a991e7ec8/bat-dg2-oem2/igt@xe_waitfence@abstime.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157036v2/bat-dg2-oem2/igt@xe_waitfence@abstime.html

  * igt@xe_waitfence@engine:
    - bat-dg2-oem2:       [FAIL][9] ([Intel XE#6519]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4121-91fc6d984707c9bfd4a60550e6a85f1a991e7ec8/bat-dg2-oem2/igt@xe_waitfence@engine.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157036v2/bat-dg2-oem2/igt@xe_waitfence@engine.html

  
  [Intel XE#6506]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506
  [Intel XE#6519]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519


Build changes
-------------

  * Linux: xe-4121-91fc6d984707c9bfd4a60550e6a85f1a991e7ec8 -> xe-pw-157036v2

  IGT_8629: 3813b62c3c6200f69d6cc8be1c5e621243ace24f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4121-91fc6d984707c9bfd4a60550e6a85f1a991e7ec8: 91fc6d984707c9bfd4a60550e6a85f1a991e7ec8
  xe-pw-157036v2: 157036v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157036v2/index.html

--===============3686551911298765617==
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
<tr><td><b>Series:</b></td><td>drm/xe: Allow compressible surfaces to be 1-way coherent (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/157036/">https://patchwork.freedesktop.org/series/157036/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157036v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157036v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4121-91fc6d984707c9bfd4a60550e6a85f1a991e7ec8_BAT -&gt; xe-pw-157036v2_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-157036v2_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-157036v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-157036v2_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_pat@pat-index-all:<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4121-91fc6d984707c9bfd4a60550e6a85f1a991e7ec8/bat-ptl-1/igt@xe_pat@pat-index-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157036v2/bat-ptl-1/igt@xe_pat@pat-index-all.html">FAIL</a></li>
<li>bat-ptl-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4121-91fc6d984707c9bfd4a60550e6a85f1a991e7ec8/bat-ptl-vm/igt@xe_pat@pat-index-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157036v2/bat-ptl-vm/igt@xe_pat@pat-index-all.html">FAIL</a></li>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4121-91fc6d984707c9bfd4a60550e6a85f1a991e7ec8/bat-ptl-2/igt@xe_pat@pat-index-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157036v2/bat-ptl-2/igt@xe_pat@pat-index-all.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-157036v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@xe_waitfence@abstime:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4121-91fc6d984707c9bfd4a60550e6a85f1a991e7ec8/bat-dg2-oem2/igt@xe_waitfence@abstime.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506">Intel XE#6506</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157036v2/bat-dg2-oem2/igt@xe_waitfence@abstime.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@engine:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4121-91fc6d984707c9bfd4a60550e6a85f1a991e7ec8/bat-dg2-oem2/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519">Intel XE#6519</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157036v2/bat-dg2-oem2/igt@xe_waitfence@engine.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4121-91fc6d984707c9bfd4a60550e6a85f1a991e7ec8 -&gt; xe-pw-157036v2</li>
</ul>
<p>IGT_8629: 3813b62c3c6200f69d6cc8be1c5e621243ace24f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4121-91fc6d984707c9bfd4a60550e6a85f1a991e7ec8: 91fc6d984707c9bfd4a60550e6a85f1a991e7ec8<br />
  xe-pw-157036v2: 157036v2</p>

</body>
</html>

--===============3686551911298765617==--
