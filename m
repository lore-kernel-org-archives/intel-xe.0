Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2F04C3ABC3
	for <intel-xe@archiver.kernel.org>; Mon, 12 May 2025 15:32:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DEA110E441;
	Mon, 12 May 2025 15:32:27 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A826E10E1A7;
 Mon, 12 May 2025 15:32:26 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6564081095685812877=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Enable_SVM_atomics_in_Xe_/_?=
 =?utf-8?q?GPU_SVM_=28rev8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 12 May 2025 15:32:26 -0000
Message-ID: <174706394668.69672.6322515231685952068@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250512135500.1405019-1-matthew.brost@intel.com>
In-Reply-To: <20250512135500.1405019-1-matthew.brost@intel.com>
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

--===============6564081095685812877==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Enable SVM atomics in Xe / GPU SVM (rev8)
URL   : https://patchwork.freedesktop.org/series/147846/
State : success

== Summary ==

CI Bug Log - changes from xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364_BAT -> xe-pw-147846v8_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (10 -> 9)
------------------------------

  Missing    (1): bat-adlp-vm 

Known issues
------------

  Here are the changes found in xe-pw-147846v8_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_mmap@vram:
    - bat-adlp-vf:        NOTRUN -> [SKIP][1] ([Intel XE#1008])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/bat-adlp-vf/igt@xe_mmap@vram.html

  * igt@xe_pat@pat-index-xelp@render:
    - bat-adlp-vf:        NOTRUN -> [ABORT][2] ([Intel XE#3970]) +1 other test abort
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html

  * igt@xe_pm_residency@gt-c6-on-idle:
    - bat-adlp-vf:        NOTRUN -> [SKIP][3] ([Intel XE#2468])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/bat-adlp-vf/igt@xe_pm_residency@gt-c6-on-idle.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - bat-adlp-vf:        NOTRUN -> [SKIP][4] ([Intel XE#3342])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/bat-adlp-vf/igt@xe_sriov_flr@flr-vf1-clear.html

  
#### Possible fixes ####

  * igt@xe_intel_bb@render@render-linear-256:
    - bat-adlp-vf:        [ABORT][5] ([Intel XE#3970]) -> [PASS][6] +1 other test pass
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/bat-adlp-vf/igt@xe_intel_bb@render@render-linear-256.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/bat-adlp-vf/igt@xe_intel_bb@render@render-linear-256.html

  
  [Intel XE#1008]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008
  [Intel XE#2468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2468
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970


Build changes
-------------

  * Linux: xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364 -> xe-pw-147846v8

  IGT_8361: 8361
  xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364: 986f0a9c6ade97d95f739c079550e53932ed4364
  xe-pw-147846v8: 147846v8

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/index.html

--===============6564081095685812877==
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
<tr><td><b>Series:</b></td><td>Enable SVM atomics in Xe / GPU SVM (rev8)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/147846/">https://patchwork.freedesktop.org/series/147846/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364_BAT -&gt; xe-pw-147846v8_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (10 -&gt; 9)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-147846v8_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/bat-adlp-vf/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008">Intel XE#1008</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp@render:</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-on-idle:</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/bat-adlp-vf/igt@xe_pm_residency@gt-c6-on-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2468">Intel XE#2468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/bat-adlp-vf/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_intel_bb@render@render-linear-256:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364/bat-adlp-vf/igt@xe_intel_bb@render@render-linear-256.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v8/bat-adlp-vf/igt@xe_intel_bb@render@render-linear-256.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364 -&gt; xe-pw-147846v8</li>
</ul>
<p>IGT_8361: 8361<br />
  xe-3068-986f0a9c6ade97d95f739c079550e53932ed4364: 986f0a9c6ade97d95f739c079550e53932ed4364<br />
  xe-pw-147846v8: 147846v8</p>

</body>
</html>

--===============6564081095685812877==--
