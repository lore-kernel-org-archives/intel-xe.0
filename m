Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6749BC87FCF
	for <intel-xe@archiver.kernel.org>; Sat,  9 Aug 2025 10:18:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1B2310E0C9;
	Sat,  9 Aug 2025 10:18:42 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7CF110E158;
 Sat,  9 Aug 2025 10:18:41 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5917293548322420382=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/xe=3A_Driver-managed_ex?=
 =?utf-8?q?haustive_eviction_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 09 Aug 2025 10:18:41 -0000
Message-ID: <175473472167.224697.5694201451728717557@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250809090909.79481-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20250809090909.79481-1-thomas.hellstrom@linux.intel.com>
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

--===============5917293548322420382==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Driver-managed exhaustive eviction (rev4)
URL   : https://patchwork.freedesktop.org/series/150796/
State : failure

== Summary ==

CI Bug Log - changes from xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7_BAT -> xe-pw-150796v4_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-150796v4_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-150796v4_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (11 -> 9)
------------------------------

  Missing    (2): bat-adlp-vm bat-ptl-vm 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-150796v4_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_sriov_flr@flr-vf1-clear:
    - bat-bmg-1:          [PASS][1] -> [FAIL][2] +2 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/bat-bmg-1/igt@xe_sriov_flr@flr-vf1-clear.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150796v4/bat-bmg-1/igt@xe_sriov_flr@flr-vf1-clear.html

  
Known issues
------------

  Here are the changes found in xe-pw-150796v4_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-adlp-7:         [PASS][3] -> [DMESG-WARN][4] ([Intel XE#4543]) +1 other test dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150796v4/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@xe_pat@pat-index-xe2@render:
    - bat-bmg-1:          [PASS][5] -> [FAIL][6] ([Intel XE#5507]) +1 other test fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/bat-bmg-1/igt@xe_pat@pat-index-xe2@render.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150796v4/bat-bmg-1/igt@xe_pat@pat-index-xe2@render.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#5507]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5507
  [Intel XE#5783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5783


Build changes
-------------

  * Linux: xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7 -> xe-pw-150796v4

  IGT_8489: 4972020ea0f3d0ac8a0d7dd4f5419119b1b30995 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7: 1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7
  xe-pw-150796v4: 150796v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150796v4/index.html

--===============5917293548322420382==
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
<tr><td><b>Series:</b></td><td>drm/xe: Driver-managed exhaustive eviction (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/150796/">https://patchwork.freedesktop.org/series/150796/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150796v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150796v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7_BAT -&gt; xe-pw-150796v4_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-150796v4_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-150796v4_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (11 -&gt; 9)</h2>
<p>Missing    (2): bat-adlp-vm bat-ptl-vm </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-150796v4_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_sriov_flr@flr-vf1-clear:<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/bat-bmg-1/igt@xe_sriov_flr@flr-vf1-clear.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150796v4/bat-bmg-1/igt@xe_sriov_flr@flr-vf1-clear.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-150796v4_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150796v4/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2@render:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7/bat-bmg-1/igt@xe_pat@pat-index-xe2@render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150796v4/bat-bmg-1/igt@xe_pat@pat-index-xe2@render.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5507">Intel XE#5507</a>) +1 other test fail</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7 -&gt; xe-pw-150796v4</li>
</ul>
<p>IGT_8489: 4972020ea0f3d0ac8a0d7dd4f5419119b1b30995 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3520-1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7: 1b96c6f660be3e8b1398037f3dff9df6f0cdb7b7<br />
  xe-pw-150796v4: 150796v4</p>

</body>
</html>

--===============5917293548322420382==--
